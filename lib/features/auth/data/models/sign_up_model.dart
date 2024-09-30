import 'package:digiflay_task/core/database/api/end_points.dart';

class SignUpModel {
  final String email;
  final String password;
  final String name;
  final String avatar;
  final String role;
  final int id;



  SignUpModel({
    required this.email,
    required this.password,
    required this.name,
    required this.avatar,
    required this.role,
    required this.id,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(

      email: jsonData[ApiKeys.email],
      password: jsonData[ApiKeys.password],
      name: jsonData[ApiKeys.name],
      avatar: jsonData[ApiKeys.avatar],
      role: jsonData[ApiKeys.role],
      id: jsonData[ApiKeys.id],
    );
  }
}
//{
// 	"email": "nico@gmail.com",
// 	"password": "1234",
// 	"name": "Nicolas",
// 	"avatar": "https://i.imgur.com/yhW6Yw1.jpg",
// 	"role": "customer",
// 	"id": 24
// }