import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_auth/pages/user/auth/model/auth_model.dart';

class AuthFormNotifier extends StateNotifier<AuthFormState> {
  AuthFormNotifier() : super(AuthFormState());
  void togglePasswordVisiblity() {
    state = state.copyWith(isPasswordHidden: !state.isPasswordHidden);
  }

  void updateName(String name) {
    String? nameError;
    if (name.isEmpty || name.length < 6) {
      nameError = "Provide your full name (min 6 chars)";
    }
    state = state.copyWith(name: name, nameError: nameError);
  }

  void updateEmail(String email) {
    String? emailError;
    if (email.isEmpty ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      emailError = "Enter a valid email";
    }
    state = state.copyWith(email: email, emailError: emailError);
  }

  void updatePassword(String password) {
    String? passwordError;
    if (password.isEmpty || password.length < 8) {
      passwordError = "Password must be at least 8 characters";
    }
    state = state.copyWith(password: password, passwordError: passwordError);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}

final authFormProvider = StateNotifierProvider<AuthFormNotifier, AuthFormState>(
  (ref) {
    return AuthFormNotifier();
  },
);
