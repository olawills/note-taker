import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taker/services/firebase/user_auth.dart';
import 'package:note_taker/ui/shared/constants/exports.dart';

class SignupController extends GetxController {
// used our UserAuthentication class we created in the user auth fil
  final userAuth = UserAuthentication();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  // initailiaze firebase auth
  final firebaseAuth = FirebaseAuth.instance;

  final error = false;
  final errorMessage = '';

  // progress handler
  bool inProgress = false;

  // save user email
  String userEmail = '';
  String get getUserEmail => userEmail;

  void singinUsers() async {
    try {
      if (emailController.text.isEmpty ||
          lastNameController.text.isEmpty ||
          firstNameController.text.isEmpty ||
          passwordController.text.isEmpty) {
        Get.snackbar(
          'Sign up Error',
          'Please complete all fields before Signing up',
          dismissDirection: DismissDirection.horizontal,
          colorText: Color(kLight.value),
          backgroundColor: Color(kDarkRed.value),
          snackPosition: SnackPosition.TOP,
        );
      } else {
        inProgress = true;
        update();
        await userAuth.registerWithEmailAndPassword(
            email: emailController.text,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            password: passwordController.text);
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
