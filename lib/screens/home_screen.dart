import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:modip_movies/constant.dart';
import 'package:modip_movies/data.dart';
import 'package:modip_movies/screens/search_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late PageController pageController;
  int activeIndex = 0;
  int currentcategorie = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: activeIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabcontroller = TabController(length: 5, vsync: this);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        children: [
          Stack(children: [
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
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
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
                            padding: const EdgeInsets.all(5),
                            height: height * .5,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.07,
                                  child: TabBar(
                                    controller: tabcontroller,
                                    physics: const BouncingScrollPhysics(),
                                    labelColor: Colors.white,
                                    unselectedLabelColor: Colors.white,
                                    isScrollable: true,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    indicator: BoxDecoration(
                                      color: kPrimaryColor,
                                      border: Border.all(color: kPrimaryColor),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    tabs: [
                                      Tab(
                                        child: Container(
                                          width: width * 0.15,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: kPrimaryColor),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "All",
                                              style: TextStyle(
                                                fontSize: width * 0.05,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: SizedBox(
                                          width: width * 0.2,
                                          child: Center(
                                            child: Text(
                                              "Series",
                                              style: TextStyle(
                                                fontSize: width * 0.05,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: SizedBox(
                                          width: width * 0.2,
                                          child: Center(
                                            child: Text(
                                              "Films",
                                              style: TextStyle(
                                                fontSize: width * 0.05,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: SizedBox(
                                          width: width * 0.25,
                                          child: Center(
                                            child: Text(
                                              "Sketchs",
                                              style: TextStyle(
                                                fontSize: width * 0.05,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: SizedBox(
                                          width: width * 0.25,
                                          child: Center(
                                            child: Text(
                                              "Labels",
                                              style: TextStyle(
                                                fontSize: width * 0.05,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: height * .4,
                                  child: TabBarView(
                                    controller: tabcontroller,
                                    children: const [
                                      Center(
                                        child: Text(
                                          "Places",
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "Hotels",
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "Monuments",
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "Parcs",
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "Parcs",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "For You",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
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
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          )),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: height * .16,
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
          const Center(
            child: Text(
              "Save",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
          const SearchScreen(),
          const Center(
            child: Text(
              "Profile",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: GNav(
              gap: 8,
              onTabChange: (index) {
                pageController.animateToPage(index,
                    duration: const Duration(microseconds: 200),
                    curve: Curves.easeInOut);
                setState(() {
                  activeIndex = index;
                });
              },
              padding: const EdgeInsets.all(12),
              color: Colors.grey,
              activeColor: Colors.white,
              tabBackgroundColor: kPrimaryColor,
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.book_outlined,
                  text: "Saved",
                ),
                GButton(
                  icon: Icons.search_outlined,
                  text: "Search",
                ),
                GButton(
                  icon: Icons.person_2_outlined,
                  text: "Profile",
                ),
              ]),
        ),
      ),
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
