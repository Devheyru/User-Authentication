// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_auth/pages/user/auth/screens/userSignUp.dart';
import 'package:user_auth/pages/user/auth/service/auth_provider.dart';
import 'package:user_auth/pages/user/auth/service/auth_service.dart';
import 'package:user_auth/pages/user/home/home_screen.dart';
import 'package:user_auth/utils/routes/go_route.dart';

import 'package:user_auth/utils/widget/myButton.dart';
import 'package:user_auth/utils/widget/mySbackBar.dart';

class UserloginPage extends ConsumerWidget {
  const UserloginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(authFormProvider);
    final formNotifier = ref.read(authFormProvider.notifier);
    final authMethod = ref.read(authMethodProvider);

    void Login() async {
      if (!formState.isFormValid) {
        formNotifier
            .showValidationErrors(); // sets nameError, emailError, passwordError
        return; // stop here, do NOT call Firebase yet
      }

      formNotifier.setLoading(true);
      final res = await authMethod.loginUser(
        email: formState.email,
        password: formState.password,
      );
      formNotifier.setLoading(false);

      if (res == "Success") {
        NavigationHelper.push(context, HomeScreen());
        Mysbackbar(
          message: "successfuly log in 🎉",
          context: context,
          isError: false,
        );
      } else {
        Mysbackbar(message: res, context: context, isError: true);
      }
    }

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height / 2.3,
              width: double.maxFinite,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff7eafc0),
                    spreadRadius: 20,
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Image.asset("assets/images/Home.png", fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  TextField(
                    autocorrect: false,
                    onChanged: (value) => formNotifier.updateEmail(value),
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "Enter your email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.all(15),
                      errorText: formState.emailError,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    autocorrect: false,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) => formNotifier.updatePassword(value),
                    obscureText: formState.isPasswordHidden,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Enter your password",

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          formNotifier.togglePasswordVisiblity();
                        },
                        icon:
                            formState.isPasswordHidden
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                      ),

                      contentPadding: EdgeInsets.all(15),

                      errorText: formState.passwordError,
                    ),
                  ),
                  SizedBox(height: 20),
                  formState.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : MyButton(
                        onTab: () {
                          Login();
                        },
                        buttonText: "Login",
                      ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(color: Colors.black, height: 1),
                      ),
                      Text("Or"),
                      Expanded(
                        child: Container(color: Colors.black, height: 1),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          NavigationHelper.push(context, UserSignUpPage());
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
