import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taker/services/firebase/user_auth.dart';
import 'package:note_taker/ui/shared/constants/exports.dart';

class SigninController extends GetxController {
  final userAuth = UserAuthentication();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // initailiaze firebase auth
  final firebaseAuth = FirebaseAuth.instance;

  // Loading status
  bool inProgress = false;

  final error = false;
  final errorMessage = '';

  // save user email
  String userEmail = '';
  String get getUserEmail => userEmail;

  void singinUsers() async {
    try {
      if (emailController.text.isEmpty) {
        Get.snackbar(
          'Login Error',
          'Email cannot be empty',
          dismissDirection: DismissDirection.horizontal,
          colorText: Color(kLight.value),
          backgroundColor: Color(kDarkRed.value),
          snackPosition: SnackPosition.TOP,
        );
      } else if (passwordController.text.isEmpty) {
        Get.snackbar(
          'Login Error',
          'Password cannot be empty',
          dismissDirection: DismissDirection.horizontal,
          colorText: Color(kLight.value),
          backgroundColor: Color(kDarkRed.value),
          snackPosition: SnackPosition.TOP,
        );
      } else {
        inProgress = true;
        update();
        await userAuth.loginWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        Get.offAndToNamed('/home');
        inProgress = false;
      }
    } on FirebaseAuthException catch (e) {
      inProgress = false;
      update();
      Get.snackbar(
        'Error',
        e.message!,
        dismissDirection: DismissDirection.horizontal,
        colorText: Color(kLight.value),
        backgroundColor: Color(kDarkRed.value),
        snackPosition: SnackPosition.TOP,
      );
    } on SocketException catch (e) {
      inProgress = false;
      update();
      Get.snackbar(
        'Internet Connection Error',
        e.message,
        dismissDirection: DismissDirection.horizontal,
        colorText: Color(kLight.value),
        backgroundColor: Color(kDarkRed.value),
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
