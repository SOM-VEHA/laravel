import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mobile/app/features/auth/presentation/state/SiginState.dart';

class SignUpController extends Notifier<LoginState> {
  final signupFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  LoginState build() {
    ref.onDispose(() {
      emailController.dispose();
      usernameController.dispose();
      phoneController.dispose();
      passwordController.dispose();
      confirmPasswordController.dispose();
    });
    return const LoginState();
  }

  void togglePassword() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  Future<void> register() async {
    final email = emailController.text.trim();
    final password = passwordController.text;
    print('Email: $email');
    print('Password: $password');
    state = state.copyWith(loading: true);
    try {
      // Call API here
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(loading: false);
    } catch (e) {
      state = state.copyWith(loading: false);
    }
  }
}
