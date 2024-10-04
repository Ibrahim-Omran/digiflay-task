import 'package:digiflay_task/core/database/api/end_points.dart';

class LoginModel {
  final String accessToken;
  final String refreshToken;

  LoginModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      accessToken: jsonData[ApiKeys.accessToken],
      refreshToken: jsonData[ApiKeys.refreshToken],
    );
  }
}



