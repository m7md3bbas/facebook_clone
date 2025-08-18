import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginService {
  Future<void> login({required String email, required String password});
  Future<void> loginWithToken({required String token});
}

class LoginLoginServiceImpe extends LoginService {
  final SupabaseClient supabaseClient;
  LoginLoginServiceImpe({required this.supabaseClient});

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
    } on AuthException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  void onAuthStateChange(void Function(AuthChangeEvent, Session?) callback) {
    supabaseClient.auth.onAuthStateChange.listen((data) {
      callback(data.event, data.session);
    });
  }

  @override
  Future<void> loginWithToken({required String token}) async {
    try {
      await supabaseClient.auth.setSession(token);
    } on AuthException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
