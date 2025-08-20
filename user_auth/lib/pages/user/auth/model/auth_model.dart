class AuthFormState {
  final String name;
  final String email;
  final String password;
  final String? nameError;
  final String? emailError;
  final String? passwordError;
  final bool isLoading;
  final bool isPasswordHidden;

  AuthFormState({
    this.name = "",
    this.email = "",
    this.password = "",
    this.nameError,
    this.emailError,
    this.passwordError,
    this.isLoading = false,
    this.isPasswordHidden = true,
  });

  bool get isFormValid =>
      name.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      nameError == null &&
      emailError == null &&
      passwordError == null;

  AuthFormState copyWith({
    String? name,
    String? email,
    String? password,
    String? nameError,
    String? emailError,
    String? passwordError,
    bool? isLoading,
    bool? isPasswordHidden,
  }) {
    return AuthFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      nameError: nameError ?? this.nameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isLoading: isLoading ?? this.isLoading,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
    );
  }
}
