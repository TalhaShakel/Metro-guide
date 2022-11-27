import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:metro_guide/screens/book_tickets/pick_end.dart';
import 'package:metro_guide/screens/book_tickets/pick_from.dart';
import 'package:metro_guide/screens/google_maps.dart';

import '../../components/bottom_bar.dart';
class GMaps extends StatefulWidget {
  const GMaps({Key? key}) : super(key: key);

  @override
  State<GMaps> createState() => _GMapsState();
}
class _GMapsState extends State<GMaps> {
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  late GoogleMapController _controller;
  Location _location = Location();

  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _location.onLocationChanged.listen((location) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(location.latitude!, location.longitude!),zoom: 15),
        ),
      );
    });
  }
 LocationData? currentLocation;
@override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children:[
                GoogleMap(
                  initialCameraPosition: CameraPosition(target: _initialcameraposition),
                  mapType: MapType.normal,
                  onMapCreated: _onMapCreated,
                  myLocationEnabled: true,
        ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 60),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => BottomBar()));
                      },
                      child: Icon(Icons.arrow_back_ios)),
                )
        ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PickFrom()));
                    },
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xff606162)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          ),
                          Text(
                            "  From",
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PickEnd()));
                    },
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xff606162)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_downward_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            "  TO",
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: Row(
                  children: [
                    SizedBox(width: 40,),
                    Container(
                      height: 45,
                      width: 220,
                      decoration: BoxDecoration(
                          color: Color(0xff77E77B),
                          borderRadius: BorderRadius.circular(40)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Go",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )
      ],
      ),
    );
  }
}
