import 'package:facebook_clone/core/service/remote/auth/login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/core/storage/secure_storage.dart';
import 'package:facebook_clone/features/auth/model/saved_account.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AuthState { unknown, signedIn, signedOut }

class SavedAccountsViewModel extends ChangeNotifier {
  List<SavedLoginAccount> _accounts = [];
  bool _isLoading = false;
  String? _error;
  AuthState _authState = AuthState.unknown;
  List<SavedLoginAccount> get accounts => _accounts;
  bool get isLoading => _isLoading;
  String? get error => _error;
  AuthState get authState => _authState;

  final LoginService loginService;
  SavedAccountsViewModel({required this.loginService}) {
    if (loginService is LoginLoginServiceImpe) {
      (loginService as LoginLoginServiceImpe).onAuthStateChange(
        _authStateListener,
      );
    }
  }

  void _authStateListener(AuthChangeEvent event, Session? session) {
    switch (event) {
      case AuthChangeEvent.signedIn:
        debugPrint("Auth Event: $event");
        _authState = AuthState.signedIn;
        break;

      case AuthChangeEvent.signedOut:
        debugPrint("Auth Event: $event");
        _authState = AuthState.signedOut;
        break;

      case AuthChangeEvent.initialSession:
        if (session != null) {
          _authState = AuthState.signedIn;
        } else {
          _authState = AuthState.signedOut;
        }
        break;

      default:
        _authState = AuthState.unknown;
    }

    notifyListeners();
  }

  void loginWithToken({required token}) async {
    _isLoading = true;
    notifyListeners();
    try {
      await loginService.loginWithToken(token: token);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();

      _isLoading = false;
      notifyListeners();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> loginWithPassword({
    required String email,
    required String passsword,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 2));
      await loginService.login(email: email, password: passsword);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> loadAccounts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _accounts = await SavedAccountsManager.loadAccounts();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> removeAllAccounts() async {
    _isLoading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 2));
      for (var acc in _accounts) {
        await SavedAccountsManager.deleteAccount(acc.userId);
      }
      _accounts.clear();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> onAccountTap(SavedLoginAccount account) async {
    final token = await SavedAccountsManager.getToken(account.userId);
    if (token != null) {
      loginWithToken(token: token);
    } else {}
  }
}
