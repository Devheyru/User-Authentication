import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_auth/pages/user/auth/model/auth_model.dart';

class AuthFormNotifier extends StateNotifier<AuthFormState> {
  AuthFormNotifier() : super(AuthFormState());

  void togglePasswordVisiblity() {
    state = state.copyWith(isPasswordHidden: !state.isPasswordHidden);
  }

  void updateName(String name) {
    // Only update the name value; do NOT set error here
    state = state.copyWith(name: name);
  }

  void updateEmail(String email) {
    // Only update the email value; do NOT set error here
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    // Only update the password value; do NOT set error here
    state = state.copyWith(password: password);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  /// Call this method when signup button is pressed
  /// It validates all fields and shows errors if invalid
  void showValidationErrors() {
    state = state.copyWith(
      showErrors: true,
      nameError:
          (state.name.isEmpty || state.name.length < 6)
              ? "Provide your full name (min 6 chars)"
              : null,
      emailError:
          (state.email.isEmpty ||
                  !RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(state.email))
              ? "Enter a valid email"
              : null,
      passwordError:
          (state.password.isEmpty || state.password.length < 8)
              ? "Password must be at least 8 characters"
              : null,
    );
  }
}

final authFormProvider = StateNotifierProvider<AuthFormNotifier, AuthFormState>(
  (ref) {
    return AuthFormNotifier();
  },
);
