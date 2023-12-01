class UserResponse {

  String? username;
  String? email;
  String? token;

  UserResponse({this.username,this.email,this.token});

  UserResponse.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    token = json['token'];
  }
}
