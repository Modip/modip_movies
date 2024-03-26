import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:modip_movies/constant.dart';
import 'package:modip_movies/data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HouseProdItem extends StatefulWidget {
  const HouseProdItem({super.key});

  @override
  State<HouseProdItem> createState() => _HouseProdItemState();
}

class _HouseProdItemState extends State<HouseProdItem> {
  int activeIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: activeIndex);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(children: [
      Container(
        color: Colors.grey,
        child: CarouselSlider.builder(
          itemCount: prodHouses.length,
          options: CarouselOptions(
            height: height * .5,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
          itemBuilder: (context, index, realIndex) {
            final prodHouse = prodHouses[index].image.toString();
            return buildImage(prodHouse, index);
          },
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 80,
            color: kPrimaryColor,
            child: const Center(
              child: Text("EvenProd"),
            ),
          ),
          Container(
            height: 80,
            color: kPrimaryColor,
            child: const Center(
              child: Text("EvenProd"),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 8,
        child: buildIndicator(),
      ),
    ]);
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: prodHouses.length,
        effect: const JumpingDotEffect(
          dotWidth: 8,
          dotHeight: 8,
          dotColor: Colors.grey,
          activeDotColor: kPrimaryColor,
        ),
      );
}

Widget buildImage(String prodHouse, int index) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(prodHouse), fit: BoxFit.cover),
      ),
    );
