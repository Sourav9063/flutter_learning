import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/Screens/TapShrinkButton/TapShrinkButton.dart';
import 'package:flutter_learning/Screens/TweenCounter/TweenCounter.dart';

import 'Screens/BounceAnimation/BounceNavScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => BounceAnimatedNavBar(),
                    ));
              },
              child: const Text("NavBarAnimation"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => TweenCounter(),
                    ));
              },
              child: const Text("TweenAnimation"),
            ),
          ),
          TapShrinkButton(
            shrinkfactor: .8,
            onTap: () {
              print("tap");
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => BounceAnimatedNavBar(),
                  ));
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              // width: MediaQuery.of(context).size.width * .5,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
              child: const Text(
                "TapShrinkButton",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
