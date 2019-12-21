import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'AnimalsL4..dart';
import 'dragObject.dart';
import 'package:audioplayers/audio_cache.dart';


class AnimalsL3 extends StatefulWidget {
  @override
  _AnimalsL3State createState() => _AnimalsL3State();
}

class _AnimalsL3State extends State<AnimalsL3> {
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
                    buildDragTarget("assets/giraffe1.png", "assets/giraffe2.png",
                        "giraffe", giraffeAcc),
                   
                  ],
                )
              ],
            ),
         
             giraffeAcc
                ? Container()
                : DragObject(
                    image: "assets/giraffe1.png",
                    position: posGiraffe,
                    dataNama: "giraffe",
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
            score+=70;
             plyr.play('success.mp3');



          });

          switch (nama) {
            case 'giraffe':
              setState(() {
                giraffeAcc = true;
                plyr.play('giraffe.mp3');
                 Navigator.push(
                                context,
          MaterialPageRoute(builder: (context) =>  AnimalsL4()),
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