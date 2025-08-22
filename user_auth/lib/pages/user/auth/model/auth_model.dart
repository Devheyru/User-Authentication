class AuthFormState {
  final String name;
  final String email;
  final String password;
  final String? nameError;
  final String? emailError;
  final String? passwordError;
  final bool isLoading;
  final bool isPasswordHidden;
  final bool showErrors;

  AuthFormState({
    this.name = "",
    this.email = "",
    this.password = "",
    this.nameError,
    this.emailError,
    this.passwordError,
    this.isLoading = false,
    this.isPasswordHidden = true,
    this.showErrors = false,
  });

  bool get isFormValid =>
      name.isNotEmpty &&
      name.length >= 6 &&
      email.isNotEmpty &&
      email.length >= 6 &&
      password.isNotEmpty &&
      password.length >= 6 &&
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
    bool? showErrors,
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
      showErrors: showErrors ?? this.showErrors,
    );
  }
}
