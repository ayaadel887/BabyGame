import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'AnimalsL3.dart';
import 'dragObject.dart';
import 'package:audioplayers/audio_cache.dart';



class AnimalsL2 extends StatefulWidget {
  @override
  _AnimalsL2State createState() => _AnimalsL2State();
}

class _AnimalsL2State extends State<AnimalsL2> {
  Offset posCamel = Offset(170, 50);
  bool camelAcc = false;

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
                Container(
                  padding: EdgeInsets.only(top: 70.0),
                  height: 200.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    buildDragTarget("assets/camel1.png", "assets/camel2.png",
                        "camel", camelAcc),
                  ],
                )
              ],
            ),
            camelAcc
                ? Container()
                : DragObject(
                    image: "assets/camel1.png",
                    position: posCamel,
                    dataNama: "camel",
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
                width: 200,
                height: 200,
              )
            : data.isEmpty
                ? Image.asset(
                    image2,
                    width: 200,
                    height: 200,
                  )
                : Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      image2,
                      width: 200,
                      height: 200,
                    ),
                  );
      },
      onAccept: (data) {
        if (data == nama) {
          setState(() {
            acc = true;
            plyr.play('small-audience-clappings-weak_MJoXSBEu_edit 1.mp3');
            plyr.play('success.mp3');
          });

          switch (nama) {
            case 'camel':
              setState(() {
                camelAcc = true;
                plyr.play('جمل.mp3');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FinalScore()),
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
          builder: (context) => AnimalsL3(),
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