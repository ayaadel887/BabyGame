import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ShapesLevels.dart';
import 'dragObject.dart';
import 'package:audioplayers/audio_cache.dart';


class ShapesL2 extends StatefulWidget {
  @override
  _ShapesL2State createState() => _ShapesL2State();
}

class _ShapesL2State extends State<ShapesL2> {

  Offset possquire = Offset(400, 50);

  bool squireAcc = false;


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
                Container(
                  height: 130,
                  child: score==100 ? Text("YOU WIN", style: TextStyle(fontSize: 50, color: Colors.red),): Container(),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

                      buildDragTarget(
                          "assets/shapes/bluesquire.jpg", "assets/shapes/bluesquire2.jpg", "squire", squireAcc),

                    ]
                )
              ],
            ),

            squireAcc
                ? Container()
                : DragObject(
              image: "assets/shapes/bluesquire.jpg",
              position: possquire,
              dataNama: "squire",
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
            plyr.play('success.mp3');

          });

          switch (nama) {


            case 'squire':
              setState(() {
                squireAcc = true;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ShapesLevels()),
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