import 'package:flutter/material.dart';
import 'package:modip_movies/constant.dart';
import 'package:modip_movies/screens/components/custom_button.dart';
import 'package:modip_movies/screens/components/my_textfield.dart';
import 'package:modip_movies/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? ontap;

  const LoginScreen({super.key, required this.ontap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void login() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/movie_logo.png",
                        ),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 5,
              ),
              MyTextfield(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextfield(
                  controller: emailController,
                  hintText: "Password",
                  obscureText: true),
              const SizedBox(
                height: 20,
              ),
              CustomButton(onTap: login, text: "Sign In"),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: kPrimaryColor, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.ontap,
                    child: const Text(
                      "Sign up ",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
