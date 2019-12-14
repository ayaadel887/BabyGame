import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dragObject.dart';
import 'package:audioplayers/audio_cache.dart';

import 'shapesL2.dart';


class Shapes1 extends StatefulWidget {
  @override
  _Shapes1State createState() => _Shapes1State();
}

class _Shapes1State extends State<Shapes1> {

  Offset posCircle = Offset(400, 50);

  bool circleAcc = false;


  int score=0;

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Your Score : $score",
                  style: TextStyle(fontSize: 25, color: Colors.yellow),
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

                      buildDragTarget(
                          "assets/shapes/REDC1.png", "assets/shapes/redcircle2.jpg", "Circle", circleAcc),

                    ]
                )
              ],
            ),

            circleAcc
                ? Container()
                : DragObject(
              image: "assets/shapes/REDC1.png",
              position: posCircle,
              dataNama: "Circle",
            ),
          ],
        ),
      ),
    );
  }

  DragTarget<String> buildDragTarget(image, image2, nama, acc) {
    return DragTarget(
      builder: (context, List<String> data, rj) {
        return acc
            ? Image.asset(
          image,
          width: 130,
          height: 130,
        )
            : data.isEmpty
            ? Image.asset(
          image2,
          width: 130,
          height: 130,
        )
            : Opacity(
          opacity: 0.7,
          child: Image.asset(
            image2,
            width: 130,
            height: 130,
          ),
        );
      },
      onAccept: (data) {
        if (data == nama) {
          setState(() {
            acc = true;
            score+=100;
            plyr.play('دائره.mp3');

          });

          switch (nama) {


            case 'Circle':
              setState(() {
                circleAcc = true;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ShapesL2()),
                );
              });
              break;

            default:
          }
        }
      },
    );
  }

  State<StatefulWidget> createState() {

    return null;
  }
}
AudioCache plyr = AudioCache();