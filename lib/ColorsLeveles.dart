import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/animation.dart';
import 'ColorL1Red.dart';
import 'ColoresL201.dart';
import 'ColorsL03.dart';





class ColorsLevels extends StatefulWidget {
  
  @override
  _ColorsLevelsState createState() => _ColorsLevelsState();
}

class _ColorsLevelsState extends State<ColorsLevels>  with SingleTickerProviderStateMixin {
 
 AnimationController animationController;
  Animation<double> animation;
  Animation<Color> animationcolor;
   ColorTween colortween2;
    ColorTween colortween;
  double size =108.0;
  @override
  void initState(){
    super.initState();
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 5)); 

    final curveAnimation=CurvedAnimation(parent: animationController,curve: Curves.bounceInOut);
    final sizeAnimation=Tween<double>(begin: 30.0,end: 35.0).animate(curveAnimation);
    
  sizeAnimation.addListener((){
setState(() {
  size=sizeAnimation.value;
});
  });
   

    //ebd2 el7raka
    animationController.forward();
  }
   @override
   void dispose(){
     // lazem a3mel dispose loh 2bl el super
     animationController.dispose();
     super.dispose();
   }

  @override
  Widget build(BuildContext context) {
   SystemChrome.setPreferredOrientations([
     DeviceOrientation.landscapeLeft,
     DeviceOrientation.landscapeRight
   ]);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          
            child: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/shapes/bglevels.jpg"),
            fit: BoxFit.contain,
          ),
        ),
            

            child: Stack(
              children: <Widget>[
            _part(top: MediaQuery.of(context).size.height/3,right: 360,color: Colors.lightBlue,value: 7,page: ()=>ColorsL03()),
             _part(top: MediaQuery.of(context).size.height/3.6,right: 410,color: Colors.purple,value: 6),
             _part(top: MediaQuery.of(context).size.height/3,right: 460,color: Colors.yellowAccent,value: 5,),
             _part(top: MediaQuery.of(context).size.height/3.6,right: 510,color: Colors.cyan,value: 4),
             _part(top: MediaQuery.of(context).size.height/3,right: 560,color: Colors.blueGrey,value: 3,page: ()=>ColorsL03()),
             _part(top: MediaQuery.of(context).size.height/3.6,right: 610,color: Colors.lime,value: 2 ,page: ()=>Colores201()),
             _part(top: MediaQuery.of(context).size.height/3,right: 660,color: Colors.lightGreen,value: 1 ,page: ()=>ColorL1Red()),
             _part1(top: MediaQuery.of(context).size.height/5,right: 690,img: 'assets/images/cp.png')


              
              ],
            ),
            ),
          ),
        )
      
    );
  }

  Widget _part({double top,double right,Color color,int value, Function page}){
    return Positioned(
      top: top,
      right: right,
      child: InkWell(
        onTap: (){
print('$value');
Navigator.push(context, MaterialPageRoute(builder: (context)=>page()));
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border(
              left: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
              top: BorderSide(color: Colors.black),
              bottom: BorderSide(color: Colors.black),
            ),
          ),
          child: CircleAvatar(
            radius: size,
            backgroundColor: color,
            child: Text('$value',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }

  Widget _part1({double top,double right, String img}){
    return Positioned(
      top: top,
      right: right,
      child: CircleAvatar(
        radius: size+25,
        backgroundColor: Colors.transparent,
        backgroundImage: ExactAssetImage('$img'),
      ),
    );
  }
}
