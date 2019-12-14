import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'AnimalsL2.dart';
import 'dragObject.dart';
import 'package:audioplayers/audio_cache.dart';


class AnimalsL1 extends StatefulWidget {
  @override
  _AnimalsL1State createState() => _AnimalsL1State();
}

class _AnimalsL1State extends State<AnimalsL1> {

  Offset posHorse = Offset(400, 50);

  bool horseAcc = false;


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
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
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
                          "assets/horse1.png", "assets/horse2.png", "horse", horseAcc),

                    ]
                )
              ],
            ),

            horseAcc
                ? Container()
                : DragObject(
              image: "assets/horse1.png",
              position: posHorse,
              dataNama: "horse",
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
            score+=25;
            plyr.play('success.mp3');

          });

          switch (nama) {


            case 'horse':
              setState(() {
                horseAcc = true;
                plyr.play('horse.mp3');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  AnimalsL2()),
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