import 'package:flutter/material.dart';
import 'package:modip_movies/constant.dart';
import 'package:modip_movies/screens/components/custom_button.dart';
import 'package:modip_movies/screens/components/my_textfield.dart';

class RegisterScreen extends StatefulWidget {
  final void Function()? ontap;

  const RegisterScreen({super.key, required this.ontap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

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
              MyTextfield(
                  controller: emailController,
                  hintText: "Confirm Password",
                  obscureText: true),
              const SizedBox(
                height: 20,
              ),
              CustomButton(onTap: () {}, text: "Register"),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: kPrimaryColor, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.ontap,
                    child: const Text(
                      "Login now ",
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
