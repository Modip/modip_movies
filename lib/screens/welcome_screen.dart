import 'package:flutter/material.dart';
import 'package:modip_movies/constant.dart';
import 'package:modip_movies/screens/auth/login_register.dart';
import 'package:modip_movies/screens/image_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomeScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(children: [
        const Positioned(
          top: 30,
          left: -130,
          child: Row(
            children: [
              ImageWidget(
                starIndex: 0,
              ),
              ImageWidget(
                starIndex: 1,
              ),
              ImageWidget(
                starIndex: 2,
              ),
            ],
          ),
        ),
        Positioned(
          top: height * .52,
          left: 110,
          right: 100,
          child: const Text(
            "mMovies ",
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: height * .45,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.transparent,
              Colors.black38,
              Colors.black54,
            ], begin: Alignment.topCenter, end: Alignment.center)),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: Text(
                      "Get ready to dive into the greatest stories in Senegalese series and films",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  width: width * .9,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Subcribe Now",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: width * .9,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginOrRegister(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account ?",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginOrRegister(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
