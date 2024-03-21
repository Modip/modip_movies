import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:modip_movies/constant.dart';
import 'package:modip_movies/data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * .48,
                decoration: const BoxDecoration(color: Colors.white),
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: CarouselSlider.builder(
                            itemCount: films.length,
                            options: CarouselOptions(
                              height: height * .5,
                              viewportFraction: 1,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              onPageChanged: (index, reason) =>
                                  setState(() => activeIndex = index),
                            ),
                            itemBuilder: (context, index, realIndex) {
                              final film = films[index].image.toString();
                              return buildImage(film, index);
                            })),
                    Positioned(
                      top: 20,
                      left: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "mMovies",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 60,
                        child: ListView.builder(
                          itemCount: categories.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            final category = categories[index];
                            return Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                category.title,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: width * .4,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    "Watch now",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Column(children: [
                Text(
                  "NOW STREAMING",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  "Exclusively on mMovies ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ]),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 8,
                child: buildIndicator(),
              ),
              const Row(
                children: [
                  Text(
                    " For You",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                height: 40,
                child: ListView.builder(
                  itemCount: foryoulist.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    final foryou = foryoulist[index];
                    return Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        foryou.title,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      )),
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: height * .15,
                child: ListView.builder(
                  itemCount: films.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    final film = films[index];
                    return Container(
                      width: width * .4,
                      margin: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(film.image),
                              fit: BoxFit.cover)),
                    );
                  }),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: films.length,
      effect: const JumpingDotEffect(
        dotWidth: 8,
        dotHeight: 8,
        dotColor: Colors.grey,
        activeDotColor: kPrimaryColor,
      ));
}

Widget buildImage(String film, int index) => Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(film), fit: BoxFit.cover)),
    );
