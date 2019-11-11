import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/Jadwal.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(),
    ));

var styleLokasiHeader = TextStyle(
    fontSize: 42.0,
    fontWeight: FontWeight.w300,
    color: Colors.white,
    fontFamily: 'Roboto');

var styleTanggalHeader = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w300,
    color: Colors.white,
    fontFamily: 'Roboto');

var styleJudul = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w300,
    color: Colors.white,
    fontFamily: 'Roboto');

var styleWaktu = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w300,
    color: Colors.white,
    fontFamily: 'Roboto');

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  Future<Jadwal> getJadwal() async {
    final response = await http.get(
        "http://muslimsalat.com/bogor.json?key=b387108c00b8355d1ebf13ff0e4cfce5");
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
    var size = MediaQuery.of(context).size;

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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Bogor",
                              style: styleLokasiHeader,
                            ),
                            Text(
                              "2019-11-11",
                              style: styleTanggalHeader,
                            )
                          ],
                        ),
                      )),
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

class ShowListJadwalUI extends StatelessWidget {
  Jadwal data;

  ShowListJadwalUI(this.data);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 16.0),
      children: <Widget>[
        containerWaktu("Subuh", data.items[0].fajr),
        containerWaktu("Dzuhur", data.items[0].dhuhr),
        containerWaktu("Ashar", data.items[0].asr),
        containerWaktu("Maghrib", data.items[0].maghrib),
        containerWaktu("Isya", data.items[0].isha)
      ],
    );
  }

  Widget containerWaktu(String judul, String waktu) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
        height: 70.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)],
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF642B73), Color(0xFFC6426E)],
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              judul,
              style: styleJudul,
            ),
            Text(
              waktu,
              style: styleWaktu,
            )
          ],
        ),
      ),
    );
  }
}

//FlexibleSpaceBar(
//centerTitle: true,
//title: Text("Jadwal Sholat"),
//background: Image.network(
//"https://images.pexels.com/photos/1020315/pexels-photo-1020315.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
//fit: BoxFit.cover,
//),
//),
