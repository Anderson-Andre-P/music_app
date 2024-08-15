import 'package:dartz/dartz.dart';
import 'package:our_music/core/useCase/use_case.dart';
import 'package:our_music/domain/repository/auth/auth.dart';

import '../../../data/models/auth/sign_in_user_req.dart';
import '../../../service_locator.dart';

class SignInUseCase implements UseCase<Either, SignInUserReq> {
  @override
  Future<Either> call({SignInUserReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
