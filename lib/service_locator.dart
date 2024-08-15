import 'package:get_it/get_it.dart';
import 'package:our_music/data/repository/auth/auth_repository_impl.dart';
import 'package:our_music/data/sources/auth/auth_firebase_service.dart';
import 'package:our_music/domain/repository/auth/auth.dart';
import 'package:our_music/domain/usecases/auth/sign_up.dart';

import 'domain/usecases/auth/sign_in.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  sl.registerSingleton<SignUpUseCase>(
    SignUpUseCase(),
  );

  sl.registerSingleton<SignInUseCase>(
    SignInUseCase(),
  );
}
