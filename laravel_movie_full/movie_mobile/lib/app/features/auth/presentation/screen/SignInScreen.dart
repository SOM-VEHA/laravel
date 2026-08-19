import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mobile/app/features/AppScreen.dart';
import 'package:movie_mobile/app/features/auth/presentation/screen/SignUpScreen.dart';
import 'package:movie_mobile/app/features/auth/presentation/state/SiginState.dart';
import '../../../../../validator/validators.dart';
import '../../../../../widget/AppPasswordField.dart';
import '../../../../../widget/AppTextField.dart';
import '../../../../../widget/CustomButton.dart';
import '../provider/SiginProvider.dart';
class SignInScreen extends ConsumerStatefulWidget {
  SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final Obscured = true;
  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(
      loginProvider, (previous, next) {
        if (next.success && !(previous?.success ?? false)) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) =>  AppScreen(),
            ),
          );
        }
      },
    );
    const brandOrange = Color(0xFFDF7F31);
    final state = ref.watch(loginProvider);
    final controller = ref.read(loginProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: controller.loginFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Welcome back 👋',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Sign in to continue',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 24),
                    AppTextField(
                      icon: Icons.email,
                      label: 'Email',
                      hintText: 'you@example.com',
                      controller: controller.emailController,
                      validator: Validators.emailValidator,
                      keyboardType: TextInputType.emailAddress,

                    ),
                    SizedBox(height: 30),
                    AppPasswordField(
                      icon: Icons.password,
                      label: 'Password',
                      controller: controller.passwordController,
                      validator: Validators.passwordValidator,
                      obscureText: state.obscurePassword,
                      onToggle: ()=>controller.togglePassword(),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        // Obx(
                        //       () => Checkbox(
                        //     value: _authController.rememberMe.value,
                        //     onChanged: (v) =>
                        //     _authController.rememberMe.value = v ?? true,
                        //   ),
                        // ),
                        const Text('Remember me'),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            // TODO: Forgot password flow
                          },
                          child: const Text('Forgot Password?'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    CustomButton(
                      isLoading: state.loading,
                      text: 'Sign In',
                      onPressed: () {
                        if (controller.loginFormKey.currentState!.validate()) {
                          controller.login();
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.g_mobiledata_rounded,
                              size: 28,
                            ),
                            label: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text('Sign in with Google'),
                            ),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          child: const Text('Sign Up'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}
