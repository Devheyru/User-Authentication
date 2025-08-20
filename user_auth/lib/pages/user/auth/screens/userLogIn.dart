import 'package:flutter/material.dart';
import 'package:user_auth/pages/user/auth/screens/userSignUp.dart';
import 'package:user_auth/utils/routes/go_route.dart';

import 'package:user_auth/utils/widget/myButton.dart';

class UserloginPage extends StatelessWidget {
  const UserloginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "Enter your email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    autocorrect: false,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Enter your password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),

                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                  SizedBox(height: 20),
                  MyButton(onTab: () {}, buttonText: "Login"),
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
