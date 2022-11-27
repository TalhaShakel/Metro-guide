import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:metro_guide/screens/book_tickets/location.dart';
import 'package:velocity_x/velocity_x.dart';

class Riyadh extends StatefulWidget {
  const Riyadh({Key? key}) : super(key: key);

  @override
  State<Riyadh> createState() => _RiyadhState();
}

class _RiyadhState extends State<Riyadh> {
  final List<Map<String, dynamic>> cityList = const [
    {
      "address": "AL",
      "id": "Thagr Plaza_01",
      "lat": 24.824633,
      "lng": 46.790478,
      "name": "Metro Station 1",
      "region": "Central-west Region of South Asia",
    },
    {
      "address": "National Guard Hospital",
      "id": "station_02",
      "lat": 24.7422,
      "lng": 46.8570,
      "name": "Metro Station 2",
      "region": "Central-west Region of South Asia",
    },
    {
      "address": "AL ZAHRA",
      "id": "station_03",
      "lat": 24.686667,
      "lng": 46.74,
      "name": "Metro Station 3",
      "region": "Central-west Region of South Asia",
    },
    {
      "address": "HITTIN",
      "id": "station_04",
      "lat": 24.7620,
      "lng": 46.6038,
      "name": "Metro Station 4",
      "region": "Central-west Region of South Asia",
    },
    {
      "address": "AL NARJIS",
      "id": "station_05",
      "lat": 24.8343,
      "lng": 46.6792,
      "name": "Metro Station 5",
      "region": "Central-west Region of South Asia",
    },
  ];
  final Map<String, Marker> _markers = {};

  var plocation = TextEditingController();
  var glocation = TextEditingController();
  Future<void> _onMapCreated(GoogleMapController controller) async {
    _markers.clear();
    setState(() {
      for (int i = 0; i < cityList.length; i++) {
        print('For Loop');
        final marker = Marker(
            markerId: MarkerId(cityList[i]['name']),
            position: LatLng(cityList[i]['lat'], cityList[i]['lng']),
            infoWindow: InfoWindow(
                title: cityList[i]['name'],
                snippet: cityList[i]['address'],
                onTap: () {
                  print("${cityList[i]['lat']},${cityList[i]['lng']}");
                  launchMap(cityList[i]['lat'], cityList[i]['lng']);
                }),
            onTap: () {
              print('print on marker');
            });
        print("${cityList[i]['lat']},${cityList[i]['lng']}");
        _markers[cityList[i]['name']] = marker;
      }
    });
  }

  static final Polyline _kPolyline =
      Polyline(polylineId: PolylineId('_kPolyline'), width: 5, points: [
    LatLng(24.824633, 46.790478),
    LatLng(24.7422, 46.8570),
    LatLng(24.686667, 46.74),
    LatLng(24.7620, 46.6038),
    LatLng(24.8343, 46.6792),
    LatLng(24.824633, 46.790478),
  ]);
  launchMap(lat, long) {
    MapsLauncher.launchCoordinates(lat, long);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height * 0.8,
              width: Get.width,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(cityList[0]['lat'], cityList[0]['lng']),
                  zoom: 9.8,
                ),
                markers: _markers.values.toSet(),
                polylines: {_kPolyline},
              ),
            ),
            "Picked Up Location".text.make(),
            TextFormField(
              controller: plocation,
              onChanged: (value) {
                print(
                    cityList[0]["address"].contains(value).toString() + "asdd");
                // cityList[1]["address"].
              },
            ),
            "Where You want to go".text.make(),
            TextFormField(
              controller: glocation,
            )
          ],
        ),
      ),
    );
  }
}
// Future<void> _gotothePlace(Map<String,dynamic>place) async{
//   final double lat = place['geometry']['location']['lat'];
//   final double lng = place['geometry']['location']['lng'];
// controller.animateCamera(CameraUpdate.newCameraPosition(
//   CameraPosition(target: LatLng(lat,lng),zoom: 12),
// ));
// }
