import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:modip_movies/data.dart';

class ImageWidget extends StatefulWidget {
  final int starIndex;
  const ImageWidget({Key? key, required this.starIndex}) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (!_scrollController.position.atEdge) {
        _autoScroll();
      }

      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _autoScroll();
      });
    });
  }

  void _autoScroll() {
    final currentScrollPosition = _scrollController.offset;
    final scrollEndPosition = _scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(
          currentScrollPosition == scrollEndPosition ? 0 : scrollEndPosition,
          duration: const Duration(seconds: 10),
          curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Transform.rotate(
      angle: 1.96 * pi,
      child: Container(
        height: height * .5,
        width: width * .55,
        margin: const EdgeInsets.only(left: 8),
        child: ListView.builder(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: films.length,
          itemBuilder: ((context, index) {
            final film = films[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.black12),
              ),
              margin: const EdgeInsets.only(left: 5, top: 5),
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: height * .18,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        image: DecorationImage(
                            image: AssetImage(film.image), fit: BoxFit.cover)),
                  )),
                  Positioned(
                      bottom: 5,
                      left: 5,
                      right: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(film.title,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black12)),
                        ],
                      ))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
