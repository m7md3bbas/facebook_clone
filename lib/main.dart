import 'package:facebook_clone/app.dart';
import 'package:facebook_clone/core/service/remote/auth/register/register_service.dart';
import 'package:facebook_clone/core/service/supabase_service.dart';
import 'package:facebook_clone/core/storage/secure_storage.dart';
import 'package:facebook_clone/features/auth/viewModel/auth_viewmode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );

  await dotenv.load(fileName: ".env");
  await SupabaseService.supaInit();
  final SupabaseClient supabase = Supabase.instance.client;
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthViewModel(
        registerService: RegisterServiceImpl(
          supabase: supabase,
          secureStorage: SecureStorage(FlutterSecureStorage()),
        ),
      ),
      child: const FaceBookClone(),
    ),
  );
}
