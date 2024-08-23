import 'package:dartz/dartz.dart';
import 'package:our_music/data/models/auth/create_user_req.dart';

import '../../../data/models/auth/sign_in_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SignInUserReq signInUserReq);

  Future<Either> getUser();
}
