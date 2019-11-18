import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jadwal_sholat/model/ResponJadwal.dart';

import "package:http/http.dart" as http;

import 'header_content.dart';
import 'list_jadwal.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(),
    ));

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  TextEditingController _locationController = TextEditingController();
  

  // membuat request data
  Future<ResponJadwal> getJadwal({String location}) async {
    String url = "http://muslimsalat.com/$location.json?key=b387108c00b8355d1ebf13ff0e4cfce5";
    // ngambil json ygn ada di url
    final response = await http.get(url);
    // memilah (decode) json dari variable response
    final jsonResponse = json.decode(response.body);
    // masukkan ke dalam class data ResponJadwal
    return ResponJadwal.fromJson(jsonResponse);
  }

  @override
  void initState() {
    // TODO: implement initState
    if (_locationController.text.isEmpty || _locationController.text == null){
      _locationController.text = "jonggol";
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final header = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width - 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 6.0,
                    offset: Offset(0.0, 2.0),
                    color: Colors.black26)
              ],
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/f6/4a/36/f64a368af3e8fd29a1b6285f3915c7d4.jpg"))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.location_on),
                  onPressed: () {
                    _showDialogEditLocation(context);
                  }),
              IconButton(
                  color: Colors.white, icon: Icon(Icons.map), onPressed: () {}),
            ],
          ),
        ),
        FutureBuilder(
            future:  getJadwal(location: _locationController.text.toLowerCase().toString()),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return HeaderContent(snapshot.data);
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }

              return Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator()),
              );
            })
      ],
    );
    final body = Expanded(
      child: FutureBuilder(
          future:  getJadwal(location: _locationController.text.toLowerCase().toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListJadwal(snapshot.data);
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            }

            return Center(child: CircularProgressIndicator());
          }),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[header, body],
      ),
    );
  }

  _showDialogEditLocation(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Ubah Lokasi"),
            content: TextField(
              controller: _locationController,
              decoration: InputDecoration(hintText: "Lokasi"),
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: new Text("Batal")),
              new FlatButton(
                  onPressed: () => Navigator.pop(context, () {
                     setState(() {
                        getJadwal(location: _locationController.text.toLowerCase().toString());
                      });
                    }),
                  child: new Text("Ok")),
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
          );
        });
  }
}
