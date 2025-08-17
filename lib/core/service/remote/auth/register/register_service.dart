import 'package:facebook_clone/core/storage/secure_storage.dart';
import 'package:facebook_clone/features/auth/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class RegisterService {
  Future<void> register({required UserModel user});
}

class RegisterServiceImpl implements RegisterService {
  final SupabaseClient supabase;
  final SecureStorage secureStorage;
  RegisterServiceImpl({required this.supabase, required this.secureStorage});

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
      final accessToken = response.session?.accessToken;
      final refreshToken = response.session?.refreshToken;

      if (saveInfo) {
        secureStorage.writeSecureData(
          SecureStorageKeys.accessToken,
          accessToken!,
        );
        secureStorage.writeSecureData(
          SecureStorageKeys.refreshToken,
          refreshToken!,
        );
      }

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
    } on AuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
