import 'package:dartz/dartz.dart';

import '../../../core/useCase/use_case.dart';
import '../../../service_locator.dart';
import '../../repository/song/song.dart';

class AddOrRemoveFavoriteSongUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SongsRepository>().addOrRemoveFromFavoriteSongs(params!);
  }
}
