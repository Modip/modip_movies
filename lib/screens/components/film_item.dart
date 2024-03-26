import 'package:flutter/material.dart';

class FilmItem extends StatelessWidget {
  const FilmItem({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * .8,
      color: Colors.blue,
      child: const Text("Film Item"),
    );
  }
}
