import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'AnimalsLevels.dart';
import 'ColorsLeveles.dart';
import 'ShapesLevels.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Smart Baby shape';

  @override
  Widget build(BuildContext context) {
    // Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(children: <Widget>[
            Row(children: [
              Expanded(
                child: Image.asset(
                  "assets/images/backgroundup.jpg",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ]),

            Row(children: <Widget>[
              Container(
                padding: EdgeInsets.all(0.0),
                alignment: Alignment.center,
                child: Text("Smart Baby game "),
                color: Colors.lightBlue[50],
                width: 170.0,
                height: 30.0,
              ),
              IconButton(
                icon: const Icon(Icons.audiotrack),
                tooltip: 'Show Snackbar',
                onPressed: () {},
              ),
            ]),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      width: 50.0,
                      padding: const EdgeInsets.all(2.0),
                      margin: const EdgeInsets.all(2.0),
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            "assets/images/shapes.jpg",
                            fit: BoxFit.cover,
                          )),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShapesLevels()),
                        );
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                        width: 150.0,
                        height: 30.0,
                        padding: const EdgeInsets.all(6.0),
                        margin: const EdgeInsets.all(4.0),
                        child:
                            const Text('اشكال', style: TextStyle(fontSize: 11)),
                      ),
                      elevation: 5.0,
                      splashColor: Colors.lightBlue[100],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/colors.jpg",
                      fit: BoxFit.cover,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ColorsLevels()),
                        );
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                        width: 150.0,
                        height: 30.0,
                        padding: const EdgeInsets.all(6.0),
                        margin: const EdgeInsets.all(4.0),
                        child:
                            const Text('الوان', style: TextStyle(fontSize: 11)),
                      ),
                      elevation: 5.0,
                      splashColor: Colors.lightBlue[100],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/animals.jpg",
                      fit: BoxFit.cover,
                    ),

                    //animalbutton
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimalsLevels()),
                        );
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                        width: 150.0,
                        height: 30.0,
                        padding: const EdgeInsets.all(6.0),
                        margin: const EdgeInsets.all(4.0),
                        child: const Text('حيوانات',
                            style: TextStyle(fontSize: 11)),
                      ),
                      elevation: 5.0,
                      splashColor: Colors.lightBlue[100],
                    ),
                  ],
                ),
              ],
            ),
            //footer
            Row(children: <Widget>[
              Expanded(
                child: Image.asset(
                  "assets/images/backgrounddown.jpg",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
