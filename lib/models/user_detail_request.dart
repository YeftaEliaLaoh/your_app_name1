class UserDetailRequest {
  String? email;
  String? password;
  String? username;

  UserDetailRequest({this.email, this.password, this.username});

  UserDetailRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    username = json['username'];
  }
}
