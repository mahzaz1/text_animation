import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedCont extends StatefulWidget {
  const AnimatedCont({Key? key}) : super(key: key);

  @override
  State<AnimatedCont> createState() => _AnimatedContState();
}

class _AnimatedContState extends State<AnimatedCont> {

  double height=100;
  double width=100;

  Color color = Colors.red;
  BorderRadiusGeometry borderRaduis = BorderRadius.circular(10);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      final random = Random();
      height = random.nextInt(400).toDouble();
      width = random.nextInt(400).toDouble();
      color = Color.fromRGBO(random.nextInt(256),random.nextInt(256), random.nextInt(256), 1);
      borderRaduis = BorderRadius.circular(random.nextInt(100).toDouble());
      setState(() {

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Container'),),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     final random = Random();
      //     height = random.nextInt(400).toDouble();
      //     width = random.nextInt(400).toDouble();
      //     color = Color.fromRGBO(random.nextInt(256),random.nextInt(256), random.nextInt(256), 1);
      //     borderRaduis = BorderRadius.circular(random.nextInt(100).toDouble());
      //     setState(() {
      //
      //     });
      //   },
      //   child: Icon(Icons.refresh),
      // ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRaduis
          ),
        ),
      ),
    );
  }
}
