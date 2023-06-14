import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_taker/ui/shared/constants/app_style.dart';
import 'package:note_taker/ui/shared/constants/colors_style.dart';
import 'package:note_taker/ui/shared/widgets/reusable_text.dart';
import 'package:note_taker/ui/views/splash/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(size: 120.h),
                SizedBox(height: 20.h),
                ReusableText(
                    text: 'Welcome To Note Taker',
                    style: appMStyle(22, Color(kDark.value), FontWeight.w500)),
              ],
            ),
          ),
        );
      },
    );
  }
}
