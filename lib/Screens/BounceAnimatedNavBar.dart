import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// https://www.youtube.com/watch?v=RVBJPXjgm9E&t=608s&ab_channel=diegoveloper
//15:11
class BounceAnimatedNavBar extends StatefulWidget {
  BounceAnimatedNavBar({Key? key}) : super(key: key);

  @override
  _BounceAnimatedNavBarState createState() => _BounceAnimatedNavBarState();
}

class _BounceAnimatedNavBarState extends State<BounceAnimatedNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bouncing Bottom NavBar"),
      ),
      body: Container(),
      bottomNavigationBar: BounceNavBar(),
    );
  }
}

const _movementWidth = 75.0;
const _movementHeight = 25.0;
Color _beginColor = Colors.red.withOpacity(.6);
Color _endColor = Colors.blue.withOpacity(.6);

class BounceNavBar extends StatefulWidget {
  BounceNavBar({Key? key}) : super(key: key);

  @override
  _BounceNavBarState createState() => _BounceNavBarState();
}

class _BounceNavBarState extends State<BounceNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animeNavBarIn;
  late Animation _animeNavBarOut;
  late Animation _animatedColor;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _animeNavBarIn =
        CurveTween(curve: Interval(0.0, .6, curve: Curves.decelerate))
            .animate(_controller);
    _animeNavBarOut =
        CurveTween(curve: Interval(0.6, 1, curve: Curves.bounceOut))
            .animate(_controller);
    _animatedColor =
        ColorTween(begin: _beginColor, end: _endColor).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double currentWidth = width;
    double currentHeight = kBottomNavigationBarHeight;
    print("NavBar build");
    return SizedBox(
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            currentWidth = width -
                (_movementWidth * _animeNavBarIn.value) +
                (_movementWidth * _animeNavBarOut.value);
            currentHeight = kBottomNavigationBarHeight +
                (_movementHeight * _animeNavBarIn.value) -
                (_movementHeight * _animeNavBarOut.value);
            return Align(
              alignment: Alignment(0, .95),
              child: Container(
                  height: currentHeight,
                  width: currentWidth - 20,
                  decoration: BoxDecoration(
                      color: _animatedColor.value,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 20,
                          child: GestureDetector(
                            child: Icon(Icons.person),
                            onTap: () {
                              _endColor = Colors.blue.withOpacity(.6);
                              _animatedColor =
                                  ColorTween(begin: _beginColor, end: _endColor)
                                      .animate(_controller);

                              _controller.forward(from: 0.0).whenComplete(() {
                                _beginColor = Colors.blue.withOpacity(.6);
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.yellow.withOpacity(.6),
                          radius: 20,
                          child: GestureDetector(
                            child: Icon(Icons.person),
                            onTap: () {
                              _endColor = Colors.yellow.withOpacity(.6);
                              _animatedColor =
                                  ColorTween(begin: _beginColor, end: _endColor)
                                      .animate(_controller);

                              _controller.forward(from: 0.0).whenComplete(() {
                                _beginColor = Colors.yellow.withOpacity(.6);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
