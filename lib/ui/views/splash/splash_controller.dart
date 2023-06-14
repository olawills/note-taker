import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final user = FirebaseAuth.instance.currentUser;

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 3));
    if (user != null) {
      Get.offAllNamed("/home");
    } else {
      Get.offAllNamed("/signin");
    }
  }
}
