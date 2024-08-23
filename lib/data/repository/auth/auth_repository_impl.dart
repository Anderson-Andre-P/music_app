import 'package:dartz/dartz.dart';
import 'package:our_music/data/models/auth/create_user_req.dart';
import 'package:our_music/data/sources/auth/auth_firebase_service.dart';
import 'package:our_music/domain/repository/auth/auth.dart';
import 'package:our_music/service_locator.dart';

import '../../models/auth/sign_in_user_req.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SignInUserReq signInUserReq) async {
    return await sl<AuthFirebaseService>().signin(signInUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }
}
