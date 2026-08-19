class LoginState {
  final bool obscurePassword;
  final bool loading;
  final bool success;

  const LoginState({
    this.obscurePassword = true,
    this.loading = false,
    this.success = false,
  });

  LoginState copyWith({
    bool? obscurePassword,
    bool? loading,
    bool? success,
  }) {
    return LoginState(
      obscurePassword: obscurePassword ?? this.obscurePassword,
      loading: loading ?? this.loading,
      success: success ?? this.success,
    );
  }
}