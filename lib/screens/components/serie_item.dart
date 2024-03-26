import 'package:flutter/material.dart';

class SerieItem extends StatelessWidget {
  const SerieItem({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * .8,
      color: Colors.red,
      child: const Text("Series Item"),
    );
  }
}
