class UserDetailResponse {
  String? username;
  String? email;
  String? token;

  UserDetailResponse({this.username, this.email, this.token});

  UserDetailResponse.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    token = json['token'];
  }
}
