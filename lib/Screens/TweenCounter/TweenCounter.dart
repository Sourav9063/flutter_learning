
import 'package:flutter/material.dart';

class TweenCounter extends StatefulWidget {
  TweenCounter({Key? key}) : super(key: key);

  @override
  _TweenCounterState createState() => _TweenCounterState();
}

class _TweenCounterState extends State<TweenCounter> {
  int counter = 0;
  int? oldCount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: TweenAnimationBuilder<double>(
            key: Key(counter.toString()),
            duration: const Duration(milliseconds: 1000),
            tween: Tween<double>(begin: 0.0, end: 1.0),
            curve: Curves.fastOutSlowIn,
            child: Text(
              counter.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 90,
                  color: Colors.white),
            ),
            builder: (context, value, child) {
              return Stack(
                children: [
                  if (oldCount != null)
                    Opacity(
                      opacity: 1 - value,
                      child: Transform.translate(
                        offset: Offset(100.0 * value, 0.0),
                        child: Text(oldCount.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 90,
                                color: Colors.white)),
                      ),
                    ),
                  Opacity(
                    opacity: value,
                    child: Transform.translate(
                        offset: Offset(-100.0 * (1 - value), 0.0),
                        child: child),
                  ),
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          oldCount = counter;
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}
