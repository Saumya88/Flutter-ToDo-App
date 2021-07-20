import 'package:todo_app/utilities/global_constants.dart';
import 'package:todo_app/utilities/size_configuration.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Splash extends StatefulWidget {
  static const String id = 'splash';

  // Background color of the screen
  final List<Color> backgroundColor;

  // Time for which screen will show up
  final int duration;

  // Next screen it will land after the splash screen => Route name
  final String nextScreenPath;

  Splash({
    required this.backgroundColor,
    required this.duration,
    required this.nextScreenPath,
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
      Duration(seconds: widget.duration),
      () => Navigator.pushReplacementNamed(context, widget.nextScreenPath),
    );
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return Scaffold(
              body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: bgBoxDecoration(widget.backgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'My ToDo App',
                          textStyle: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                      ],
                      totalRepeatCount: 4,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                    Text("Don't forget at all..",
                        style: TextStyle(
                            color: kBlackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            fontStyle: FontStyle.normal)),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

Decoration bgBoxDecoration(List<Color> bgColor) {
  var noOfColors = bgColor.length;
  List<double> noOfParts = [];
  double temp = 0;
  for (int i = 0; i < noOfColors; i++) {
    temp = temp + 1 / noOfColors;
    noOfParts.add(temp);
  }
  return noOfColors == 1
      ? BoxDecoration(color: bgColor[0])
      : BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: noOfParts,
          colors: bgColor,
        ));
}
