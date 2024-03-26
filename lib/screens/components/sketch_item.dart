import 'package:flutter/material.dart';

class Sketchtem extends StatelessWidget {
  const Sketchtem({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * .8,
      color: Colors.green,
      child: const Text("Sketch Item"),
    );
  }


}
