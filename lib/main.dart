import 'package:flutter/material.dart';
import 'Sound.dart';
import 'dimension.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
double get keyWidth => 94 + (125 * _widthRatio);
double _widthRatio = 1.43;
double posx = 100.0;
double posy = 100.0;
int i=0;
List<bool> ispressed=[false,false,false,false,false,false,false,false,false,false,false,false];

class _MyAppState extends State<MyApp> {


  void onTapDown(BuildContext context, TapDownDetails details) {
    print('${details.globalPosition}');
    final RenderBox box = context.findRenderObject();
    final Offset localOffset = box.globalToLocal(details.globalPosition);
    setState(() {
      posx = localOffset.dx;
      posy = localOffset.dy;
    });
  }

  void settingkeynumber(){
    while(i<12){
      if(keynumber == i){
        setState(() {
          ispressed[i]=true;
          playSound(1);
          ispressed[i]=false;
        });
      }
      i=i+1;
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'roboVITics',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("VR Piano")),

        body: ListView.builder(
          itemCount: 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return SafeArea(
              child: Stack(children: <Widget>[
                Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  buildKey(1,false,ispressed[0]),
                  buildKey(2,false,ispressed[1]),
                  buildKey(3,false,ispressed[2]),
                  buildKey(4,false,ispressed[3]),
                  buildKey(5,false,ispressed[4]),
                  buildKey(6,false,ispressed[5]),
                  buildKey(7,false,ispressed[6]),
                ]),
                Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 100,
                    top: 0.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(width: keyWidth * .5),
                          buildKey(1,true,ispressed[7]),
                          buildKey(2,true,ispressed[8]),
                          Container(width: keyWidth),
                          buildKey(3,true,ispressed[9]),
                          buildKey(4,true,ispressed[10]),
                          buildKey(5,true,ispressed[11]),
                          Container(width: keyWidth * .5),
                        ])),
              ]),
            );
          },
        ),
      ),
    );

  }
  Widget buildKey(int a, bool accidental,ispressed) {
    final pianoKey = Stack(
      children: <Widget>[
            Material(
                borderRadius: borderRadius,
                color: accidental ? Colors.black : Colors.white,
                child: GestureDetector(
                  onTapDown: (TapDownDetails details) => onTapDown(context, details),
                )
            )
      ],
    );
    if (accidental) {
      return Container(

          width: keyWidth,
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          decoration: BoxDecoration(
              border: ispressed ? Border.all(color: Colors.grey) : accidental ? Border.all(color: Colors.black) : Border.all(color: Colors.white) ),
          padding: EdgeInsets.symmetric(horizontal: keyWidth * .1),
          child: Material(
              elevation: 6.0,
              borderRadius: borderRadius,
              shadowColor: Color(0x802196F3),
              child: pianoKey));
    }
    return Container(
        width: keyWidth,
        child: pianoKey,
        margin: EdgeInsets.symmetric(horizontal: 2.0));
  }

}
const BorderRadiusGeometry borderRadius = BorderRadius.only(
    bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0));



