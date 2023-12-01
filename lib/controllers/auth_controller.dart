import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task/services/dio_service.dart';
import 'package:task/models/user_response.dart';

class AuthController extends GetxController {
  RxList<UserResponse> userResponse = RxList();
  RxBool isExist = false.obs;

   register(String username, String email, String password) async {
    isExist.value = false;
    var params = {
      "user":  {
        "username": username,
        "email": email,
        "password": password,
      }
    };
    debugPrint('register1: $params');
    var response = await DioService.postURL(
        "http://localhost:3000/api/users", params);
    userResponse = RxList();
    if (response.statusCode == 200) {
      userResponse.add(UserResponse.fromJson(response.data["user"]));
      debugPrint('register2: $userResponse');
      isExist.value = true;
    }
    log(response.statusCode.toString());
  }

  login(String email, String password) async {
    isExist.value = false;
    var params = {
      "user":  {
        "email": email,
        "password": password,
      }
    };
    debugPrint('login1: $params');
    var response = await DioService.postURL(
        "http://localhost:3000/api/users/login", params);
    userResponse = RxList();
    if (response.statusCode == 200) {
      userResponse.add(UserResponse.fromJson(response.data["user"]));
      debugPrint('login2: $userResponse');
      isExist.value = true;
    }
    log(response.statusCode.toString());
  }

}
