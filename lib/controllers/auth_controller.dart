import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task/services/dio_service.dart';
import 'package:task/models/user_response.dart';
import 'dart:developer';

class AuthController extends GetxController {
  RxList<UserResponse> userResponse = RxList();
  RxBool isLoading = true.obs;

  register(String username, String email, String password) async {
    isLoading.value = true;
    var params = {
      "user":  {
        "username": username,
        "email": email,
        "password": password,
      }
    };
    debugPrint('auth1: $params');
    var response = await DioService.postURL(
        "http://localhost:3000/api/users", params);
    userResponse = RxList();
    if (response.statusCode == 200) {
      userResponse.add(UserResponse.fromJson(response.data["user"]));
      debugPrint('auth2: $userResponse');
    }
    isLoading.value = false;
    log(response.statusCode);
  }

}
