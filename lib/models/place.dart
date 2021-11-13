// To parse this JSON data, do
//
//     final place = placeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Place> placeFromJson(String str) => List<Place>.from(json.decode(str).map((x) => Place.fromJson(x)));

String placeToJson(List<Place> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Place {
    Place({
        required this.id,
        required this.address,
        required this.detail,
        required this.img1,
        required this.img2,
        required this.lat,
        required this.lng,
        required this.name,
        required this.suggesttime,
        required this.placetype,
        required this.province,
    });

    int id;
    String address;
    String detail;
    String img1;
    String img2;
    double lat;
    double lng;
    String name;
    int suggesttime;
    Placetype placetype;
    Province province;

    factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"],
        address: json["address"],
        detail: json["detail"],
        img1: json["img1"],
        img2: json["img2"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        name: json["name"],
        suggesttime: json["suggesttime"],
        placetype: Placetype.fromJson(json["placetype"]),
        province: Province.fromJson(json["province"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "detail": detail,
        "img1": img1,
        "img2": img2,
        "lat": lat,
        "lng": lng,
        "name": name,
        "suggesttime": suggesttime,
        "placetype": placetype.toJson(),
        "province": province.toJson(),
    };
}

class Placetype {
    Placetype({
        required this.typeid,
        required this.typename,
    });

    int typeid;
    String typename;

    factory Placetype.fromJson(Map<String, dynamic> json) => Placetype(
        typeid: json["typeid"],
        typename: json["typename"],
    );

    Map<String, dynamic> toJson() => {
        "typeid": typeid,
        "typename": typename,
    };
}

class Province {
    Province({
        required this.provid,
        required this.provname,
    });

    int provid;
    String provname;

    factory Province.fromJson(Map<String, dynamic> json) => Province(
        provid: json["provid"],
        provname: json["provname"],
    );

    Map<String, dynamic> toJson() => {
        "provid": provid,
        "provname": provname,
    };
}
