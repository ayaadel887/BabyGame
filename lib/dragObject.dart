import 'package:flutter/material.dart';
class DragObject extends StatefulWidget {

  final String image;
  final Offset position;
  final String dataNama;

  DragObject({this.image,this.position,this.dataNama});


  @override
  _DragObjectState createState() => _DragObjectState();
}

class _DragObjectState extends State<DragObject> {

  Offset pos;

  @override
  void initState() {
    pos=widget.position;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: pos.dy,
      left: pos.dx,
      child: Draggable(
        child: Image.asset(widget.image, width: 130,height: 130,),
        data: widget.dataNama,
        feedback: Opacity(opacity: 0.8, child: Image.asset(widget.image, width: 130,height: 130,),),
        onDraggableCanceled: (view, offset){
          setState(() {
            pos=offset;
          });
        },
      ),

    );
  }
}