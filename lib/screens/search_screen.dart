import 'package:flutter/material.dart';
import 'package:modip_movies/constant.dart';
import 'package:modip_movies/data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Search",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: width * 0.9,
              height: height * 0.07,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 8,
                        color: Colors.white,
                        spreadRadius: -4)
                  ]),
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search your ...",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: kPrimaryColor,
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "For You",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
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
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: height * .28,
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
                          image: AssetImage(film.image), fit: BoxFit.cover)),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Continue Watch",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: height * .28,
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
                          image: AssetImage(film.image), fit: BoxFit.cover)),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
