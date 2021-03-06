
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dragObject.dart';
import 'package:audioplayers/audio_cache.dart';

import 'shapesL2.dart';

class ShapesL03 extends StatefulWidget {
  @override
  _ShapesL03State createState() => _ShapesL03State();
}

class _ShapesL03State extends State<ShapesL03> {
  
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
          if (nama=='triangle') {
          
              setState(() {
               triangleAcc = true;
                plyr.play('مثلث.wav');
               Navigator.push(
                                context,
          MaterialPageRoute(builder: (context) =>  ShapesL2()),
               ); 
              });
              
          }
        
      },
    );
  }

  State<StatefulWidget> createState() {
   
    return null;
  }
}
AudioCache plyr = AudioCache();

