import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app_api/models/place.dart';
import 'package:http/http.dart' as http;

class HttpHomePage extends StatefulWidget {
  String? provinceID;
  HttpHomePage({Key? key, this.provinceID}) : super(key: key);

  @override
  _HttpHomePageState createState() => _HttpHomePageState();
}

class _HttpHomePageState extends State<HttpHomePage> {
  Future<List<Place>> loadData() async {
    String url = 'http://202.28.34.197:8888/tsptravel/place/';
    if (widget.provinceID != null) {
      url += "/province/" + widget.provinceID!;
    }
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<Place> places = placeFromJson(response.body);
      log(places.length.toString());
      return places;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadData(),
        builder: (context, AsyncSnapshot<List<Place>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!.isNotEmpty) {
              return Scaffold(
                appBar: AppBar(),
                body: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(snapshot.data![index].img1,
                            width: 70),
                        title: Text(snapshot.data![index].name),
                      );
                    }),
              );
            } else {
              return Scaffold();
            }
          }
          return Scaffold();
        });
  }
}
