import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mobile/widget/AppTextField.dart';

import '../../../../../validator/validators.dart';
import '../../../../../widget/AppPasswordField.dart';
import '../provider/SingnUpProvider.dart';
class SignUpScreen extends ConsumerStatefulWidget {
  SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signupProvider);
    final controller = ref.read(signupProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: controller.signupFormKey, // <-- Wrap form
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Welcome 👋',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Sign up to continue',
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
                    const SizedBox(height: 20),

                    AppTextField(
                      icon: Icons.phone,
                      label: 'Phone',
                      hintText: '015618463',
                      controller: controller.phoneController,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Phone is required';
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 20),

                    AppPasswordField(
                      icon: Icons.lock,
                      label: 'Password',
                      controller: controller.passwordController,
                      validator: Validators.passwordValidator,
                      obscureText: state.obscurePassword,
                      onToggle: ()=>controller.togglePassword(),
                    ),
                    const SizedBox(height: 20),

                    AppPasswordField(
                      icon: Icons.lock,
                      label: 'Confirm Password',
                      controller: controller.confirmPasswordController,
                      validator: Validators.passwordValidator,
                      obscureText: state.obscurePassword,
                      onToggle: ()=>controller.togglePassword(),
                    ),
                    const SizedBox(height: 30),

                    // Obx(() => SizedBox(
                    //     width: double.infinity,
                    //     child: ElevatedButton(
                    //       onPressed: authController.isLoading.value ? null :authController.login,
                    //       style: ElevatedButton.styleFrom(
                    //         backgroundColor: Colors.black,
                    //         foregroundColor: Colors.white,
                    //         padding: const EdgeInsets.symmetric(vertical: 16),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(14),
                    //         ),
                    //       ),
                    //       child: authController.isLoading.value
                    //           ? const CircularProgressIndicator(
                    //         color: Colors.white,
                    //       )
                    //           : const Text(
                    //         'Create Account',
                    //         style: TextStyle(fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
                              child: Text('Sign Up with Google'),
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
                        const Text('Already have an account? '),
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Text('Sign In'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
