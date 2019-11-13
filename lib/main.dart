import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jadwal_sholat/show_header_ui.dart';

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
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.edit_location,
                          color: Colors.white,
                        ),
                        onPressed: () {})
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://img.freepik.com/free-vector/mandala-illustration_53876-81806.jpg"))),
                          child: FutureBuilder<Jadwal>(
                            future: getJadwal(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ShowHeaderUI(snapshot.data);
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }

                              return Center(child: CircularProgressIndicator());
                            },
                          ))),
                )
              ];
            },
            body: FutureBuilder<Jadwal>(
              future: getJadwal(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ShowListJadwalUI(snapshot.data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return Center(child: CircularProgressIndicator());
              },
            )));
  }
}
