import 'package:dartz/dartz.dart';
import 'package:our_music/core/useCase/use_case.dart';
import 'package:our_music/data/models/auth/create_user_req.dart';
import 'package:our_music/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SignUpUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
