import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {

  bool showAnim = false;
  double top1 = 70;
  double top2 = 130;
  double left = 500;

  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 9000),(){
      setState((){
        showAnim = true;

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AnimatedTextKit(
          onFinished: (){
            showAnim = true;
          },
          repeatForever: false,
          totalRepeatCount: 1,
          animatedTexts: [
            RotateAnimatedText('Hello'),
            RotateAnimatedText('Welcome'),
            RotateAnimatedText('To'),
            WavyAnimatedText('My App'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: TextLiquidFill(
                  loadDuration: Duration(seconds: 999999),
                  boxHeight: 50,
                  boxWidth: 120,
                  boxBackgroundColor: Colors.orange,
                  text: 'Welcome',
                  textStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            AnimatedPositioned(
              top: top1,
              left: 0,
              right: 0,
              duration: Duration(milliseconds: 500),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: AnimatedTextKit(
                      repeatForever: false,
                      totalRepeatCount: 1,
                      animatedTexts: [

                        TyperAnimatedText(
                          "How's My Animation?",
                          speed: Duration(milliseconds: 100),
                        ),
                        TyperAnimatedText(
                          "Do you like this Animations",
                          speed: Duration(milliseconds: 100),
                        ),
                        TyperAnimatedText(
                          "Woowwwww.....",
                          speed: Duration(milliseconds: 100),
                        ),
                      ]),
                ),
              ),
            ),
            showAnim ? AnimatedPositioned(
              top: top2,
              left: 0,
              right: 0,
              duration: Duration(milliseconds: 500),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: AnimatedTextKit(
                      onFinished: (){
                        setState(() {
                          top1= 130;
                          top2= 70;
                        });
                      },
                      repeatForever: false,
                      totalRepeatCount: 1,
                      animatedTexts: [
                        WavyAnimatedText(
                          "Thanks",
                        ),

                      ]),
                ),
              ),
            ):Container(),
            Positioned(
              top: 190,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Stay',
                        textScaleFactor: 2,
                      ),
                      SizedBox(width: 20,),
                      DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,

                        ),

                        child: AnimatedTextKit(
                            onFinished: (){
                              setState(() {
                                left=0;
                              });
                            },
                            repeatForever: false,
                            totalRepeatCount: 2,
                            animatedTexts: [
                              RotateAnimatedText(
                                "Cool",
                              ),
                              RotateAnimatedText(
                                "Hungury",
                              ),
                              RotateAnimatedText(
                                "Foolish",
                              ),
                              RotateAnimatedText(
                                "Tuned",
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
                top: 0,
                left: left,
                right: 0,
                duration: Duration(milliseconds: 600),
                child: Container(
                  height:590,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('Finished',style: TextStyle(fontSize: 30,color: Colors.white),)),
                ))
          ],
        ),
      ),
    );
  }
}
