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

const _movement = 50.0;

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
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _animeNavBarIn =
        CurveTween(curve: Interval(0.1, .6, curve: Curves.decelerate))
            .animate(_controller);
    _animeNavBarOut =
        CurveTween(curve: Interval(0.6, 1, curve: Curves.bounceOut))
            .animate(_controller);
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
    print("NavBar build");
    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            currentWidth = width -
                (_movement * _animeNavBarIn.value) +
                (_movement * _animeNavBarOut.value);
            return Center(
              child: Container(
                  width: currentWidth,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        child: GestureDetector(
                          child: Icon(Icons.person),
                          onTap: () {
                            _controller.forward(from: 0.0);
                          },
                        ),
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
