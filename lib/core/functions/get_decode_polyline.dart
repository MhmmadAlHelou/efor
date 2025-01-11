import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future getPolyline(lat, long, destLat, detsLong) async {
  String url =
      "https://maps.gomaps.pro/maps/api/directions/json?origin=$lat,$long&destination=$destLat,$detsLong&key=AlzaSylCdinS03Z9UVoHZS9uGa-KIv7MxaKEo6e";

  List<LatLng> polylineCo = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Polyline> polylineSet = {};

  var response = await http.get(Uri.parse(url));
  // var response = await http.post(Uri.parse(url));
  var responseBody = jsonDecode(response.body);
  var point = responseBody['routes'][0]['overview_polyline']['points'];

  List<PointLatLng> result = polylinePoints.decodePolyline(point);

  if (result.isNotEmpty) {
    result.forEach((PointLatLng pointLatLng) {
      polylineCo.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    });
  }

  Polyline polyline = Polyline(
    polylineId: const PolylineId('po1'),
    points: polylineCo,
    color: Colors.deepPurpleAccent,
    width: 5,
  );

  polylineSet.add(polyline);

  return polylineSet;
}
