import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ColorsL03.dart';
import 'dragObject.dart';
import 'package:audioplayers/audio_cache.dart';


class ColorL2 extends StatefulWidget {
  @override
  _ColorL2State createState() => _ColorL2State();
}

class _ColorL2State extends State<ColorL2> {
  
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
              });

      
          
           
            if(nama =='squire') {
              setState(() {
                squireAcc = true;
                plyr.play('ازرق.wav');
               Navigator.push(
                                context,
          MaterialPageRoute(builder: (context) =>  ColorsL03()),
               ); 
              });}
              
          
        }
      },
    );
  }

  State<StatefulWidget> createState() {
   
    return null;
  }
}
AudioCache plyr = AudioCache();