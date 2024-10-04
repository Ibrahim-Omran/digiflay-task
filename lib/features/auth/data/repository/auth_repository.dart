
import 'package:dartz/dartz.dart';
import 'package:digiflay_task/core/database/api/api_consumer.dart';
import 'package:digiflay_task/core/database/api/end_points.dart';
import 'package:digiflay_task/core/error/exceptions.dart';
import 'package:digiflay_task/features/auth/data/models/login_model.dart';
import 'package:digiflay_task/features/auth/data/models/sign_up_model.dart';

import '../../../../core/service/service_locator.dart';

class AuthRepository {

  // login ..
  Future<Either<String,LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.login,
          data: {
        ApiKeys.email: email,
        ApiKeys.password: password,
      });

      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }


  // signUp ..
  Future<Either<String,SignUpModel>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.signUp,
          data: {
            ApiKeys.name: name,
            ApiKeys.email: email,
            ApiKeys.password: password,
            ApiKeys.avatar: 'https://i.imgur.com/yhW6Yw1.jpg',
          });

      return Right(SignUpModel.fromJson(response));
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }






}
