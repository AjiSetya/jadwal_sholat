import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jadwal_sholat/show_header_ui.dart';
import 'package:jadwal_sholat/text_style.dart';

import 'model/Jadwal.dart';
import 'show_list_jadwal_ui.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(),
    ));

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  Future<Jadwal> getJadwal() async {
    final response = await http.get(
        "http://muslimsalat.com/jonggol.json?key=b387108c00b8355d1ebf13ff0e4cfce5");
    final jsonResponse = json.decode(response.body);
    return Jadwal.fromJsonMap(jsonResponse);
  }

  @override
  void initState() {
    super.initState();
    getJadwal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width - 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6.0,
                      offset: Offset(0.0, 2.0),
                      color: Colors.black26,
                    )
                  ],
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://image.freepik.com/free-vector/ramadan-landscape-background-sunset_1048-1789.jpg"))),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.map,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
            FutureBuilder<Jadwal>(
              future: getJadwal(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ShowHeaderUI(snapshot.data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
        Expanded(
            child: FutureBuilder<Jadwal>(
          future: getJadwal(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ShowListJadwalUI(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return Center(child: CircularProgressIndicator());
          },
        ))
      ],
    ));
  }
}
