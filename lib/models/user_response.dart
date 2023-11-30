import 'package:task/models/user_detail_response.dart';

class UserResponse {

  String? username;
  String? email;
  String? password;

  UserResponse({this.username,this.email,this.password});

  UserResponse.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }
}
