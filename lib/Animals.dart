import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dragObject.dart';
import 'package:audioplayers/audio_cache.dart';


class Animals extends StatefulWidget {
  @override
  _AnimalsState createState() => _AnimalsState();
}

class _AnimalsState extends State<Animals> {
  Offset posZebra = Offset(50, 50);
  Offset posCamel = Offset(170, 50);
  Offset posGiraffe = Offset(270, 50);
  Offset posHorse = Offset(400, 50);

  bool horseAcc = false;
  bool camelAcc = false;
  bool zebraAcc = false;
  bool giraffeAcc = false;

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
                Container(
                  height: 130,
                  child: score==100 ? Text("YOU WIN", style: TextStyle(fontSize: 50, color: Colors.red),): Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    buildDragTarget(
                        "assets/camel1.png", "assets/camel2.png", "camel", camelAcc),
                    buildDragTarget(
                        "assets/horse1.png", "assets/horse2.png", "horse", horseAcc),
                    buildDragTarget("assets/giraffe1.png", "assets/giraffe2.png",
                        "giraffe", giraffeAcc),
                    buildDragTarget(
                        "assets/zebra1.png", "assets/zebra2.png", "zebra", zebraAcc),
                  ],
                )
              ],
            ),
            zebraAcc
                ? Container()
                : DragObject(
                    image: "assets/zebra1.png",
                    position: posZebra,
                    dataNama: "zebra",
                  ),
            giraffeAcc
                ? Container()
                : DragObject(
                    image: "assets/giraffe1.png",
                    position: posGiraffe,
                    dataNama: "giraffe",
                  ),
            camelAcc
                ? Container()
                : DragObject(
                    image: "assets/camel1.png",
                    position: posCamel,
                    dataNama: "camel",
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
            case 'camel':
              setState(() {
                camelAcc = true;
              });
              break;
            case 'horse':
              setState(() {
                horseAcc = true;
                plyr.play('horse.mp3');
              });
              break;
            case 'zebra':
              setState(() {
                zebraAcc = true;
              });
              break;
            case 'giraffe':
              setState(() {
                giraffeAcc = true;
                plyr.play('giraffe.mp3');

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