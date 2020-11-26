import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> getkey() {
  return http.get('Mitra has to give me the API');
}
class get_key {
  final int userId;
  final int id;
  final String title;

  get_key({this.userId, this.id, this.title});

  factory get_key.fromJson(Map<String, dynamic> json) {
    return get_key(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

Future<get_key> fetchkey() async {
  final response = await http.get('Mitra has to give me the API');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return get_key.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
class gettingkey extends StatefulWidget {
  @override
  _gettingkeyState createState() => _gettingkeyState();
}

class _gettingkeyState extends State<gettingkey> {
  Future<get_key> futurekey;
  int keynumber;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    futurekey = fetchkey();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<get_key>(
      future: futurekey,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          keynumber=snapshot.data.userId;
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
