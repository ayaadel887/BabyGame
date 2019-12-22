import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ColorsLeveles.dart';
import 'dragObject.dart';
import 'package:audioplayers/audio_cache.dart';


class Colores201 extends StatefulWidget {
  @override
  _Colores201State createState() => _Colores201State();
}

class _Colores201State extends State<Colores201> {
  Offset posgreens = Offset(50, 50);
  Offset posyallot = Offset(170, 50);
 

  bool greeensAcc = false;
  bool yallotAcc = false;

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
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    buildDragTarget(
                        "assets/shapes/yt1.jpg", "assets/shapes/yallotriangle2.png","yallow", yallotAcc),
                    buildDragTarget(
                        "assets/shapes/gs.jpg", "assets/shapes/gs2.png", "green", greeensAcc),
                   
                  ],
                )
              ],
            ),
          yallotAcc
                ? Container()
                : DragObject(
                    image: "assets/shapes/yt1.jpg",
                    position: posyallot,
                    dataNama: "yallow",
                  ),
            
            
            greeensAcc
                ? Container()
                : DragObject(
                    image: "assets/shapes/gs.jpg",
                    position: posgreens,
                    dataNama: "green",
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
            score+=1;
             plyr.play('success.mp3');
             if(score==2)  { Navigator.push( context,
                  MaterialPageRoute(builder: (context) => ColorsLevels()),
                );}

          });

          switch (nama) {
            case 'yallow':
              setState(() {
                yallotAcc = true;
               plyr.play('اصفر.wav'); 
              });
              break;
            case 'green':
              setState(() {
                greeensAcc = true;
                plyr.play('أخضر.wav');
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