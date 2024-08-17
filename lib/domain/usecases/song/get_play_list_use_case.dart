import 'package:dartz/dartz.dart';

import '../../../core/useCase/use_case.dart';
import '../../../service_locator.dart';
import '../../repository/song/song.dart';

class GetPlayListUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepository>().getPlayList();
  }
}
