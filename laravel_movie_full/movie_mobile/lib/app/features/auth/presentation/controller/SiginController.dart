import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mobile/app/core/storage/token_storage.dart';
import 'package:movie_mobile/app/features/auth/presentation/state/SiginState.dart';
import '../../../../network/api_exception.dart';
import '../../data/repository/AuthRepository.dart';
import '../provider/AuthRepositoryProvider.dart';

class LoginController extends Notifier<LoginState> {
  late final AuthRepository authRepository;
  late final TokenStorage tokenStorage;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  @override
  LoginState build() {
    authRepository = ref.read(authRepositoryProvider);
    tokenStorage = ref.read(tokenStorageProvider);
    ref.onDispose(() {
      emailController.dispose();
      passwordController.dispose();
    });
    return const LoginState();
  }

  void togglePassword()=>state = state.copyWith(obscurePassword: !state.obscurePassword);
  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    print('Email: $email');
    state = state.copyWith(
      loading: true,
      success: false,
    );
    try {
      print('CALLING REPOSITORY...');
      final auth = await authRepository.login(email: email, password: password);
      print('REPOSITORY RETURNED');
      print('LOGIN SUCCESS');
      print('Auth: $auth');
      await tokenStorage.saveToken(auth.token);
      state = state.copyWith(
        loading: false,
        success: true,
      );
    } on ApiException catch (e) {
      print('LOGIN API ERROR: ${e.message}');
      state = state.copyWith(loading: false);
    } catch (e, stackTrace) {
      print('LOGIN ERROR: $e');
      print(stackTrace);
      state = state.copyWith(loading: false);
    }
  }
}
