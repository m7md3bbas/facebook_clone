import 'package:facebook_clone/core/storage/secure_storage.dart';
import 'package:facebook_clone/features/auth/model/saved_account.dart';
import 'package:facebook_clone/features/auth/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class RegisterService {
  Future<void> register({required UserModel user, bool saveInfo = false});
}

class RegisterServiceImpl implements RegisterService {
  final SupabaseClient supabase;
  RegisterServiceImpl({required this.supabase});

  @override
  Future<void> register({
    required UserModel user,
    bool saveInfo = false,
  }) async {
    try {
      final response = await supabase.auth.signUp(
        email: user.email!,
        password: user.password!,
      );
      final userId = response.user?.id;

      if (userId != null) {
        await supabase
            .from('profiles')
            .update({
              'fullname': user.fullName,
              'avatar_url': user.profileImage,
              'birthday': user.birthday,
              'gender': user.gender,
            })
            .eq('id', userId);
      }
      final refreshToken = response.session?.refreshToken;
      if (saveInfo) {
        SavedAccountsManager.saveAccount(
          SavedLoginAccount(userId: userId!, name: user.fullName!),
          refreshToken!,
        );
      }
    } on AuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
