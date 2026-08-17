import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/storage/token_storage.dart';
import '../modules/app/AppScreen.dart';
import '../modules/auth/SignInScree.dart';
import '../data/services/AuthService.dart';

class AuthController extends GetxController {

  var isLoggedIn = false.obs;

  final isLoading = false.obs;

  final Obscured = true.obs;

  final rememberMe = true.obs;

  final loginFormKey = GlobalKey<FormState>();

  final signupFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final usernameController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordConfirmController = TextEditingController();

  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) return;
    isLoading.value = true;
    final success = await AuthService.login(emailController.text, passwordController.text);
    isLoading.value = false;
    if (success) {
      clear();
      Get.snackbar('Welcome', 'Signed in successfully');
      Get.offAll(() => AppScreen());
    } else {
      Get.snackbar('Error', 'Invalid credentials');
    }
  }

  Future<void> SignUp() async {
    if (!loginFormKey.currentState!.validate()) return;
    isLoading.value = true;
    final success = await AuthService.login(emailController.text, passwordController.text);
    isLoading.value = false;
    if (success) {
      clear();
      Get.snackbar('Welcome', 'Signed in successfully');
      Get.offAll(() => AppScreen());
    } else {
      Get.snackbar('Error', 'Invalid credentials');
    }
  }


  Future<void> logout() async {
    await AuthService.logout();
    Get.offAll(() => SignInScreen());
  }

  Future<void> checkToken() async {
    final token = await TokenStorage.getToken();
    isLoggedIn.value = token != null && token.isNotEmpty;
  }

  Future<void> clear()async{
    emailController.clear();
    passwordController.clear();
    usernameController.clear();
    phoneController.clear();
  }

}
