import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_auth/pages/user/auth/screens/userLogIn.dart';
import 'package:user_auth/pages/user/auth/service/auth_provider.dart';
import 'package:user_auth/pages/user/auth/service/auth_service.dart';
import 'package:user_auth/pages/user/home/home_screen.dart';
import 'package:user_auth/utils/routes/go_route.dart';
import 'package:user_auth/utils/widget/myButton.dart';
import 'package:user_auth/utils/widget/mySbackBar.dart';

class UserSignUpPage extends ConsumerWidget {
  const UserSignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(authFormProvider);
    final formNotifier = ref.read(authFormProvider.notifier);
    final authMethod = ref.read(authMethodProvider);

    void signup() async {
      if (!formState.isFormValid) {
        formNotifier
            .showValidationErrors(); // sets nameError, emailError, passwordError
        return; // stop here, do NOT call Firebase yet
      }

      formNotifier.setLoading(true);
      final res = await authMethod.signUpUser(
        email: formState.email,
        password: formState.password,
        name: formState.name,
      );
      formNotifier.setLoading(false);

      if (res == "Success") {
        NavigationHelper.push(context, HomeScreen());
        Mysbackbar(
          message: "Sign up successful 🎉",
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
              height: height / 2.4,
              width: double.maxFinite,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff7EAFC0),
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
                    keyboardType: TextInputType.text,
                    onChanged: (value) => formNotifier.updateName(value),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Enter your name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.all(15),
                      errorText: formState.nameError,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => formNotifier.updateEmail(value),
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
                        onTab: formState.isFormValid ? signup : null,
                        buttonText: "Signup",
                      ),
                  Row(
                    children: [
                      Spacer(),
                      Text("Alrady have an account? "),
                      GestureDetector(
                        onTap: () {
                          NavigationHelper.pushReplacement(
                            context,
                            UserloginPage(),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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
