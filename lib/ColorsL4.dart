import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ColorsL03.dart';
import 'dragObject.dart';
import 'package:audioplayers/audio_cache.dart';


class ColorsL4 extends StatefulWidget {
  @override
  _ColorsL4State createState() => _ColorsL4State();
}

class _ColorsL4State extends State<ColorsL4> {
  
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
                plyr.play('small-audience-clappings-weak_MJoXSBEu_edit 1.mp3');
           Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FinalScore()),
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

class FinalScore extends StatefulWidget {
  @override
  _FinalScoreState createState() => _FinalScoreState();
}

class _FinalScoreState extends State<FinalScore> {
  //Stars :
  var stars = Container(
      padding: EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 80.0,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 80.0,
          ),
          Icon(
            Icons.star,
            color: Colors.grey,
            size: 80.0,
          ),
          Icon(
            Icons.star,
            color: Colors.grey,
            size: 80.0,
          )
        ],
      ));

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ColorsL03(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 70.0),
        height: 200.0,
        child: Center(
          child: stars,
        ));
  }
}
