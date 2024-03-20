import 'package:flutter/material.dart';
import 'package:modip_movies/screens/login_screen.dart';
import 'package:modip_movies/screens/register_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLogin = true;
  void togglePage() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginScreen(ontap: togglePage);
    } else {
      return RegisterScreen(ontap: togglePage);
    }
  }
}
