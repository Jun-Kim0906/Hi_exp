import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_app/controllers/user_controller.dart';
import 'package:hi_app/models/user_model.dart';
import 'package:hi_app/services/firebase_path.dart';
import 'package:hi_app/services/firestore_service.dart';

class GuardController extends GetxController {
  TextEditingController passwordController = TextEditingController();

  bool confirmPage = false;

  String bufferPWD = '';

  bool isValid = true;

  bool passwordValid = true;


  void goToConfirmPage(String pwd) {
    confirmPage = true;
    bufferPWD = pwd;
    passwordController.clear();
    update();
  }

  bool checkValid() {
    if (passwordController.text != bufferPWD) {
      isValid = false;
      update();
      return false;
    } else {
      UserModel user = Get
          .find<UserController>()
          .user
          .copyWith(pwdExist: true, pwd: passwordController.text);
      FirestoreService.instance.setData(
          path: FirestorePath.user(user.phoneNum),
          data: user
              .toMap());
      Get.find<UserController>().setUser(user);
      return true;
    }
  }

  bool checkPassword(){
    UserModel user = Get.find<UserController>().user;
    if(passwordController.text == user.pwd){
      return true;
    }else{
      isValid = false;
      update();
      return false;
    }
  }
}
