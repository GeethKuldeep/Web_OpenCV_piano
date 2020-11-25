import 'package:flutter/material.dart';
import 'package:tonic/tonic.dart';
import 'package:flutter/services.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'dart:convert';
import 'package:web_flutter_piano/dimension.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  GlobalKey _keyblack1 = GlobalKey();
  GlobalKey _keyblack2 = GlobalKey();
  GlobalKey _keyblack3 = GlobalKey();
  GlobalKey _keyblack4 = GlobalKey();
  GlobalKey _keyblack5 = GlobalKey();
  GlobalKey _keyblack6 = GlobalKey();
  GlobalKey _keyblack7 = GlobalKey();
  GlobalKey _keywhite1 = GlobalKey();
  GlobalKey _keywhite2 = GlobalKey();
  GlobalKey _keywhite3 = GlobalKey();
  GlobalKey _keywhite4 = GlobalKey();
  GlobalKey _keywhite5 = GlobalKey();



  double get keyWidth => 94 + (125 * _widthRatio);
  double _widthRatio = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'roboVITics',
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(title: Text("VR Piano")),
          drawer: Drawer(
              child: SafeArea(
                  child: ListView(children: <Widget>[
                    Container(height: 20.0),
                    ListTile(title: Text("Change Width")),
                    Slider(
                        activeColor: Colors.redAccent,
                        inactiveColor: Colors.white,
                        min: 0.0,
                        max: 1.0,
                        value: _widthRatio,
                        onChanged: (double value) =>
                            setState(() => _widthRatio = value)),
                  ]))),

          body: ListView.builder(
            itemCount: 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return SafeArea(
                child: Stack(children: <Widget>[
                  Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    _buildKey(1,false,_keyblack1),
                    _buildKey(2,false,_keyblack2),
                    _buildKey(3,false,_keyblack3),
                    _buildKey(4,false,_keyblack4),
                    _buildKey(5,false,_keyblack5),
                    _buildKey(6,false,_keyblack6),
                    _buildKey(7,false,_keyblack7),
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
                            _buildKey(1,true,_keywhite1),
                            _buildKey(2,true,_keywhite2),
                            Container(width: keyWidth),
                            _buildKey(3,true,_keywhite3),
                            _buildKey(4,true,_keywhite4),
                            _buildKey(5,true,_keywhite5),
                            Container(width: keyWidth * .5),
                          ])),
                ]),
              );
            },
          ),
      ),
    );
  }
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }
  _afterLayout(_) {
    getSizes1();
    getPositions1();
    getSizes2();
    getPositions2();
    getSizes3();
    getPositions3();
    getSizes4();
    getPositions4();
    getSizes5();
    getPositions5();
    getSizes6();
    getPositions6();
    getSizes7();
    getPositions7();
    getSizes8();
    getPositions8();
    getSizes9();
    getPositions9();
    getSizes10();
    getPositions10();
    getSizes11();
    getPositions11();
    getSizes12();
    getPositions12();
  }


  double posx = 100.0;
  double posy = 100.0;



  void playSound(int soundNumber) {
    final assetsAudioPlayer = AssetsAudioPlayer();

    assetsAudioPlayer.open(
      Audio("note$soundNumber.wav"),
    );
  }

  Widget _buildKey(int a, bool accidental,keynumber) {
    final pianoKey = Stack(
      children: <Widget>[
        Semantics(
            button: true,

            child: Material(
                borderRadius: borderRadius,
                color: accidental ? Colors.black : Colors.white,
                child: GestureDetector(
                  child: InkWell(
                    key: keynumber,
                    borderRadius: borderRadius,
                    highlightColor: Colors.grey,
                    onTap: () {},
                    onTapDown: (_) => playSound(a),
                  ),

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