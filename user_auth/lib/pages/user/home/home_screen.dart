import 'package:flutter/material.dart';
import 'package:user_auth/pages/user/auth/screens/userLogIn.dart';
import 'package:user_auth/pages/user/auth/service/auth_service.dart';
import 'package:user_auth/utils/routes/go_route.dart';

AuthMethod authmethod = AuthMethod();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authmethod.signOut();
            NavigationHelper.pushAndRemoveUntil(context, UserloginPage());
          },
          child: Text("logOut"),
        ),
      ),
    );
  }
}
