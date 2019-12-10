import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'AnimalsLevels.dart';
import 'dragObject.dart';
import 'package:audioplayers/audio_cache.dart';


class AnimalsL4 extends StatefulWidget {
  @override
  _AnimalsL4State createState() => _AnimalsL4State();
}

class _AnimalsL4State extends State<AnimalsL4> {
    Offset posZebra = Offset(50, 50);
    bool zebraAcc = false;

  Offset posGiraffe = Offset(270, 50);
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
                           Navigator.push(
                                context,
          MaterialPageRoute(builder: (context) =>  AnimalsLevels()),
               );  

          });

          switch (nama) {
             case 'zebra':
              setState(() {
                zebraAcc = true;
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