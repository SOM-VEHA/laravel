import 'package:flutter/material.dart';
import '../../../../../validator/validators.dart';
import '../../../../../widget/AppPasswordField.dart';
import '../../../../../widget/AppTextField.dart';
import '../../../../../widget/CustomButton.dart';
class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final Obscured = true;

  final loginFormKey = GlobalKey<FormState>();

  final signupFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final usernameController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const brandOrange = Color(0xFFDF7F31);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: loginFormKey,
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
                      controller: emailController,
                      validator: Validators.emailValidator,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 30),
                    AppPasswordField(
                      icon: Icons.password,
                      label: 'Password',
                      controller: passwordController,
                      validator: Validators.passwordValidator,
                      obscureText: true,
                      onToggle: () {
                        // authController.Obscured.value = !authController.Obscured.value;
                      },
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
                      text: 'Sign In',
                      onPressed: () {
                        // _authController.login();
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Get.offAll(AppScreen());
                          // authController.login();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
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
                            // Get.to(SignUpScreen());
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
