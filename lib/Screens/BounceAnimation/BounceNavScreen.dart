import 'package:flutter/material.dart';

import 'BounceAnimatedNavBar.dart';

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
      bottomNavigationBar: BounceNavBar(
        initialIndex: 2,
        items: [
          BounceAnimatedNavBarItem(
            widget: Icon(
              Icons.list,
            ),
            foregroundColor: Colors.purple,
            backgroundColor: Colors.purpleAccent,
          ),
          BounceAnimatedNavBarItem(
            widget: Icon(
              Icons.search,
            ),
            foregroundColor: Colors.blue,
            backgroundColor: Colors.blueAccent,
          ),
          BounceAnimatedNavBarItem(
            widget: Icon(
              Icons.home,
            ),
            foregroundColor: Colors.pinkAccent.shade700,
            backgroundColor: Colors.pinkAccent.shade400,
          ),
          BounceAnimatedNavBarItem(
            widget: Icon(
              Icons.account_circle,
            ),
            foregroundColor: Colors.indigo,
            backgroundColor: Colors.indigoAccent,
          ),
          BounceAnimatedNavBarItem(
            widget: Icon(
              Icons.settings,
            ),
            foregroundColor: Colors.deepPurpleAccent,
            backgroundColor: Colors.deepPurple,
          ),
        ],
        onTabChanged: (value) {
          print(value);
        },
      ),
    );
  }
}
