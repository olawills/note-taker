import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_taker/ui/shared/constants/exports.dart';
import 'package:note_taker/ui/shared/utils/validator_manager.dart';
import 'package:note_taker/ui/shared/widgets/custom_btn.dart';
import 'package:note_taker/ui/shared/widgets/custom_txt_field.dart';
import 'package:note_taker/ui/shared/widgets/reusable_text.dart';
import 'package:note_taker/ui/views/signup/signup_controller.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: Column(
                  children: [
                    ReusableText(
                      text: 'Register to Note Taker to Record Your Things',
                      style: appMStyle(28, Color(kDark.value), FontWeight.w500),
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                      labelText: 'First Name',
                      hintText: 'Enter first name',
                      keyboardType: TextInputType.name,
                      inputController: controller.firstNameController,
                      validator: Validator().name,
                      isValidationMessage: true,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      labelText: 'Last Name',
                      hintText: 'Enter last name',
                      keyboardType: TextInputType.name,
                      inputController: controller.lastNameController,
                      validator: Validator().name,
                      isValidationMessage: true,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      labelText: 'Email',
                      hintText: 'Enter Email',
                      keyboardType: TextInputType.emailAddress,
                      inputController: controller.emailController,
                      validator: Validator().email,
                      isValidationMessage: true,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      labelText: 'Password',
                      hintText: 'Enter Passwod',
                      keyboardType: TextInputType.text,
                      suffixIcon: true,
                      inputController: controller.passwordController,
                      validator: Validator().password,
                    ),
                    SizedBox(height: 20.h),
                    CustomBtn(
                      text:
                          controller.inProgress ? 'Registering..' : 'Register',
                      textColor: Color(kLight.value),
                      color: controller.inProgress
                          ? Color(kDarkGrey.value)
                          : Color(kDarkRed.value),
                      width: Get.width,
                      height: Get.height * 0.08,
                      loadingStatus: controller.inProgress,
                      onTap: () => controller.singinUsers(),
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Already Have an account ',
                              style: appMStyle(
                                  15, Color(kDark.value), FontWeight.w500)),
                          TextSpan(
                            text: 'Signin',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.back(),
                            style: appMStyle(
                                15, Color(kDarkRed.value), FontWeight.w500),
                          )
                        ],
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
