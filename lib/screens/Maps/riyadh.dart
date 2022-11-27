import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:metro_guide/screens/book_tickets/location.dart';
import 'package:velocity_x/velocity_x.dart';

var lat;

var lng;

var lat2;
var lng2;

class Riyadh extends StatefulWidget {
  const Riyadh({Key? key}) : super(key: key);

  @override
  State<Riyadh> createState() => _RiyadhState();
}

class _RiyadhState extends State<Riyadh> {
  final List<Map<String, dynamic>> cityList = const [
    {
      // "address": "AL MUNSIYAH",
      "address": "AL",
      "id": "Thagr Plaza_01",
      "lat": 24.824633,
      "lng": 46.790478,
      "name": "Metro Station 1",
      "region": "Central-west Region of South Asia",
    },
    {
      // "address": "National Guard Hospital",
      "address": "AL2",
      "id": "station_02",
      "lat": 24.7422,
      "lng": 46.8570,
      "name": "Metro Station 2",
      "region": "Central-west Region of South Asia",
    },
    {
      // "address": "AL ZAHRA",
      "address": "AL3",
      "id": "station_03",
      "lat": 24.686667,
      "lng": 46.74,
      "name": "Metro Station 3",
      "region": "Central-west Region of South Asia",
    },
    {
      // "address": "HITTIN",
      "address": "AL4",
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

  LatLng l1 = LatLng(lat ?? 0.0, lng ?? 0.0);
  LatLng l2 = LatLng(lat2 ?? 0.0, lng2 ?? 0.0);
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _kPolyline;
      _markers;
      l1;
      l2;
      lat;
      lng;
      lat2;
      lng2;
    });
    super.initState();
  }

  static Polyline _kPolyline =
      Polyline(polylineId: PolylineId('_kPolyline'), width: 5,
          //     points: [

          //   // LatLng(24.824633, 46.790478),
          //   // LatLng(24.7422, 46.8570),
          //   // LatLng(24.686667, 46.74),
          //   // LatLng(24.7620, 46.6038),
          //   // LatLng(24.8343, 46.6792),
          //   // LatLng(24.824633, 46.790478),
          // ]
          points: [
        LatLng(lat ?? 0.0, lng ?? 0.0),
        LatLng(lat2 ?? 0.0, lng2 ?? 0.0),
        // l1,
        // l2,
        // LatLng(24.824633, 46.790478),
        // LatLng(24.7422, 46.8570),
      ]
          // points: [
          //   LatLng(lat ?? 0.0, lng ?? 0.0),
          //   LatLng(lat2 ?? 0.0, lng2 ?? 0.0)
          // ]
          );
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
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: "Picked Up Location".text.make(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 8,
                child: TextFormField(
                  controller: plocation,
                  onChanged: (value) {
                    setState(() {
                      for (var i = 0; i < cityList.length; i++) {
                        if (cityList[i]["address"].contains(value)) {
                          print(1);
                          lat = cityList[0]["lat"];
                          lng = cityList[0]["lng"];
                        }
                      }
                      // if (cityList[0]["address"].contains(value)) {
                      //   print(1);
                      //   lat = cityList[0]["lat"];
                      //   lng = cityList[0]["lng"];
                      // } else if (cityList[1]["address"].contains(value)) {
                      //   lat = cityList[1]["lat"];
                      //   lng = cityList[1]["lng"];
                      // } else if (cityList[2]["address"].contains(value)) {
                      //   lat = cityList[2]["lat"];
                      //   lng = cityList[2]["lng"];
                      // }
                    });
                    // print(cityList.contains(value));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: "Where You want to go".text.make(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 8,
                child: TextFormField(
                  controller: glocation,
                  onChanged: (value) {
                    setState(() {
                      for (var i = 0; i < cityList.length; i++) {
                        if (cityList[i]["address"].contains(value)) {
                          lat2 = cityList[i]["lat"];
                          lng2 = cityList[i]["lng"];

                          // l2 = LatLng(lat2, lng2);
                          _kPolyline = Polyline(
                              polylineId: PolylineId('_kPolyline'),
                              width: 5,
                              points: [
                                LatLng(lat ?? 0, lng ?? 0),
                                LatLng(lat2 ?? 0, lng2 ?? 0)
                              ]);
                          // print(l2);
                        }
                      }
                      if (cityList[1]["address"].contains(value)) {
                        lat2 = cityList[1]["lat"];
                        lng2 = cityList[1]["lng"];

                        // l2 = LatLng(lat2, lng2);
                        _kPolyline = Polyline(
                            polylineId: PolylineId('_kPolyline'),
                            width: 5,
                            points: [
                              LatLng(lat ?? 0, lng ?? 0),
                              LatLng(lat2 ?? 0, lng2 ?? 0)
                            ]);
                        // print(l2);
                      }
                    });
                  },
                ),
              ),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       // if (cityList[0]["address"]
            //       //     .contains(plocation.text.toString().trim())) {
            //       //   // double val1 = cityList[0]["lat"];
            //       //   // double val2 = cityList[0]["lng"];
            //       //   print(1);
            //       //   lat = cityList[0]["lat"];
            //       //   lng = cityList[0]["lng"];
            //       //   // l1 = LatLng(cityList[0]["lat"], cityList[0]["lng"]);
            //       //   // l1 = LatLng(lat, lng);

            //       //   print(l1);
            //       // }
            //       // if (cityList[1]["address"]
            //       //     .contains(glocation.text.toString().trim())) {
            //       //   print(12);

            //       //   // double val1 = cityList[0]["lat"];
            //       //   // double val2 = cityList[0]["lng"];
            //       //   lat2 = cityList[1]["lat"];
            //       //   lng2 = cityList[1]["lng"];
            //       //   // print(l)

            //       //   // l1 = LatLng(cityList[1]["lat"], cityList[1]["lng"]);
            //       //   // l2 = LatLng(lat2, lng2);

            //       //   print(l2);
            //       // }
            //       setState(() {
            //         // Get.to(() => Riyadh());
            //         lat = 24.824633;
            //         lng = 46.790478;
            //         lat2 = 24.7422;
            //         lng2 = 46.857;
            //         _kPolyline = Polyline(
            //             polylineId: PolylineId('_kPolyline'),
            //             width: 5,
            //             points: [
            //               LatLng(lat ?? 0, lng ?? 0),
            //               LatLng(lat2 ?? 0, lng2 ?? 0)
            //             ]);
            //       });
            //     },
            //     child: Text("search"))
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
