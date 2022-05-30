import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;

class Airoports {
  late final List<Airoport> airoports;

  Airoports({required this.airoports});

  Airoports.fromJson(Map<String, dynamic> json) {
    if (json['airoports'] != null) {
      airoports = <Airoport>[].cast<Airoport>();
      json['airoports'].forEach((v) {
        airoports.add(new Airoport.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.airoports != null) {
      data['airoports'] = this.airoports.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Airoport {
      late final String code;
      late final String lat;
      late final String lon;
      late final String name;
      late final String city;
      late final String state;
      late final String country;
      late final String woeid;
      late final String tz;
      late final String phone;
      late final String type;
      late final String email;
      late final String url;
      late final String runwayLength;
      late final String elev;
      late final String icao;
      late final String directFlights;
      late final String carriers;

  Airoport(
      {required this.code,
       required this.lat,
       required this.lon,
       required this.name,
       required this.city,
       required this.state,
       required this.country,
       required this.woeid,
       required this.tz,
       required this.phone,
       required this.type,
       required this.email,
       required this.url,
       required this.runwayLength,
       required this.elev,
       required this.icao,
       required this.directFlights, required this.carriers});

  Airoport.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    lat = json['lat'];
    lon = json['lon'];
    name = json['name'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    woeid = json['woeid'];
    tz = json['tz'];
    phone = json['phone'];
    type = json['type'];
    email = json['email'];
    url = json['url'];
    runwayLength = json['runway_length'];
    elev = json['elev'];
    icao = json['icao'];
    directFlights = json['direct_flights'];
    carriers = json['carriers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['name'] = this.name;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['woeid'] = this.woeid;
    data['tz'] = this.tz;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['email'] = this.email;
    data['url'] = this.url;
    data['runway_length'] = this.runwayLength;
    data['elev'] = this.elev;
    data['icao'] = this.icao;
    data['direct_flights'] = this.directFlights;
    data['carriers'] = this.carriers;
    return data;
  }
}
Future<Airoports> getPlaces() async {
  // Fallback for when the above HTTP request fails.
  return Airoports.fromJson(
    json.decode(
      await rootBundle.loadString('assets/airports.json'),
    ),
  );
}
