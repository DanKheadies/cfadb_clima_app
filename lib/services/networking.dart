import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  final String path;
  final double lat;
  final double lon;
  final String city;
  final String apiKey;

  NetworkHelper({
    @required this.url,
    @required this.path,
    this.lat,
    this.lon,
    this.city,
    @required this.apiKey,
  });

  Future<Map> getLocationData() async {
    Uri uri = Uri.https(url, path, {
      'lat': '$lat',
      'lon': '$lon',
      'units': 'imperial',
      'appid': '$apiKey',
    });

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      return null;
    }
  }

  Future<Map> getCityData() async {
    Uri uri = Uri.https(url, path, {
      'q': '$city',
      'units': 'imperial',
      'appid': '$apiKey',
    });

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
