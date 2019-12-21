
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dragObject.dart';
import 'package:audioplayers/audio_cache.dart';

import 'shapesL2.dart';

class Shapes4 extends StatefulWidget {
  @override
  _Shapes4State createState() => _Shapes4State();
}

class _Shapes4State extends State<Shapes4> {
  
  Offset postriangle = Offset(400, 50);

  bool triangleAcc = false;

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
                        "assets/shapes/redt1.png", "assets/shapes/redt2.png", "triangle",triangleAcc ),
                   
                  ]
                )
              ],
            ),
           
         triangleAcc
                ? Container()
                : DragObject(
                    image: "assets/shapes/redt1.png",
                    position: postriangle,
                    dataNama: "triangle",
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
             plyr.play('r.mp3');

          });

          if (nama=='triangle') {
          
              setState(() {
               triangleAcc = true;
               Navigator.push(
                                context,
          MaterialPageRoute(builder: (context) =>  ShapesL2()),
               ); 
              });
              
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

