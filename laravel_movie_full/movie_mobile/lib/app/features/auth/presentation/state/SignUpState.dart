class SignUpState {
  final bool obscurePassword;
  final bool loading;
  const SignUpState({this.obscurePassword = true, this.loading = false});
  SignUpState copyWith({bool? obscurePassword, bool? loading}) {
    return SignUpState(
      obscurePassword: obscurePassword ?? this.obscurePassword,
      loading: loading ?? this.loading,
    );
  }
}
