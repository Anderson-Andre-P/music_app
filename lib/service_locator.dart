import 'package:get_it/get_it.dart';
import 'package:our_music/data/repository/auth/auth_repository_impl.dart';
import 'package:our_music/data/repository/song/song_repository_impl.dart';
import 'package:our_music/data/sources/auth/auth_firebase_service.dart';
import 'package:our_music/data/sources/song/song_firebase_service.dart';
import 'package:our_music/domain/repository/auth/auth.dart';
import 'package:our_music/domain/repository/song/song.dart';
import 'package:our_music/domain/usecases/auth/sign_up.dart';
import 'package:our_music/domain/usecases/song/get_new_song_use_case.dart';

import 'domain/usecases/auth/sign_in.dart';
import 'domain/usecases/song/get_play_list_use_case.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  sl.registerSingleton<SongsRepository>(
    SongRepositoryImpl(),
  );

  sl.registerSingleton<SignUpUseCase>(
    SignUpUseCase(),
  );

  sl.registerSingleton<SignInUseCase>(
    SignInUseCase(),
  );

  sl.registerSingleton<GetNewsSongsUseCase>(
    GetNewsSongsUseCase(),
  );

  sl.registerSingleton<GetPlayListUseCase>(
    GetPlayListUseCase(),
  );
}
