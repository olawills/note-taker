import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_taker/ui/shared/constants/exports.dart';
import 'package:note_taker/ui/shared/utils/validator_manager.dart';
import 'package:note_taker/ui/shared/widgets/custom_btn.dart';
import 'package:note_taker/ui/shared/widgets/custom_txt_field.dart';
import 'package:note_taker/ui/shared/widgets/reusable_text.dart';
import 'package:note_taker/ui/views/signin/signin_controller.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SigninController>(
        init: SigninController(),
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: 'Welcome Back',
                      style: appMStyle(25, Color(kDark.value), FontWeight.w600),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      labelText: 'Email',
                      hintText: 'Enter Email',
                      keyboardType: TextInputType.emailAddress,
                      inputController: controller.emailController,
                      validator: (value) => Validator().name(value),
                      isValidationMessage: true,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      labelText: 'Password',
                      hintText: 'Enter Passwod',
                      keyboardType: TextInputType.text,
                      inputController: controller.passwordController,
                      suffixIcon: true,
                      validator: (value) => Validator().password(value),
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: CustomBtn(
                        text: controller.inProgress ? 'Loggin in...' : 'Login',
                        textColor: Color(kLight.value),
                        color: controller.inProgress
                            ? Color(kDarkGrey.value)
                            : Color(kDarkRed.value),
                        width: Get.width,
                        height: Get.height * 0.08,
                        loadingStatus: controller.inProgress,
                        onTap: () => controller.singinUsers(),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Center(
                      child: RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Don\'t Have an account ',
                              style: appMStyle(
                                  15, Color(kDark.value), FontWeight.w500)),
                          TextSpan(
                            text: 'Signup',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.toNamed('/signup'),
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
          );
        },
      ),
    );
  }
}
