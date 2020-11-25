import 'package:flutter/material.dart';
import 'Sound.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
double get keyWidth => 94 + (125 * _widthRatio);
double _widthRatio = 1.43;
double posx = 100.0;
double posy = 100.0;

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
                  buildKey(1,false),
                  buildKey(2,false),
                  buildKey(3,false),
                  buildKey(4,false),
                  buildKey(5,false),
                  buildKey(6,false),
                  buildKey(7,false),
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
                          buildKey(1,true),
                          buildKey(2,true),
                          Container(width: keyWidth),
                          buildKey(3,true),
                          buildKey(4,true),
                          buildKey(5,true),
                          Container(width: keyWidth * .5),
                        ])),
              ]),
            );
          },
        ),
      ),
    );

  }
  Widget buildKey(int a, bool accidental) {
    final pianoKey = Stack(
      children: <Widget>[
        Semantics(
            button: true,

            child: Material(
                borderRadius: borderRadius,
                color: accidental ? Colors.black : Colors.white,
                child: GestureDetector(
                  child: InkWell(
                    borderRadius: borderRadius,
                    highlightColor: Colors.grey,
                    onTap: () {},
                    onTapDown: (_) => playSound(a),
                  ),
                  onTapDown: (TapDownDetails details) => onTapDown(context, details),
                )
            )
        ),
      ],
    );
    if (accidental) {
      return Container(
          width: keyWidth,
          margin: EdgeInsets.symmetric(horizontal: 2.0),
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



