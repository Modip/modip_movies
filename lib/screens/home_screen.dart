import 'package:flutter/material.dart';
import 'package:modip_movies/constant.dart';
import 'package:modip_movies/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List movies = List.of(films);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * .6,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      films[0].image.toString(),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
