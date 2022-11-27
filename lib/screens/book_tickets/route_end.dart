import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:metro_guide/screens/book_tickets/maps.dart';

import 'package:metro_guide/screens/book_tickets/pick_end.dart';

import '../google_maps.dart';
import 'g_maps.dart';
import 'maps.dart';
class RouteEnd extends StatefulWidget {
  var to;
    RouteEnd({Key? key,required this.to}) : super(key: key);

  @override
  State<RouteEnd> createState() => _RouteEndState();

}

class _RouteEndState extends State<RouteEnd> {

  void initState(){
    super.initState();
    _email.text=widget.to["Station name"]??"";
  }
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
  TextEditingController _email = TextEditingController();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child:  GoogleMap(
              initialCameraPosition: CameraPosition(target: _initialcameraposition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 200,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Color(0xff77E77B),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(45))),
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 20,)),
                          SizedBox(width: 70,),
                          Text("Ending Point",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600),)
                        ],
                      ),
                      SizedBox(height: 20,),

                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PickEnd()));
                        },
                        child:   Row(
                          children: [
                            SizedBox(width: 20,),
                            Text("To.",style: GoogleFonts.poppins(fontSize: 16),),
                            SizedBox(width: 5,),

                            Container(
                              width: 180,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.black)
                              ),
                              child: TextFormField(
                                controller: _email,
                                cursorColor: Colors.black54,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    hintText: 'Ending Point',
                                    suffixIcon: GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PickEnd()));
                                        },
                                        child: Icon(Icons.arrow_forward_ios_rounded,size: 17,color: Colors.black,)),
                                    contentPadding: EdgeInsets.only(top: 3,left: 10),
                                    border: InputBorder.none,
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 10, color: Colors.black)),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      // Row(
                      //   children: [
                      //     SizedBox(width: 20,),
                      //     Text("To.",style: GoogleFonts.poppins(fontSize: 16),),
                      //     SizedBox(width: 42,),
                      //
                      //     Container(
                      //       width: 180,
                      //       height: 40,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(30),
                      //           border: Border.all(color: Colors.black)
                      //       ),
                      //       child: TextFormField(
                      //         controller: _email,
                      //         cursorColor: Colors.black54,
                      //         autovalidateMode: AutovalidateMode.onUserInteraction,
                      //         decoration: InputDecoration(
                      //             hintText: 'Location',
                      //             suffixIcon: Icon(Icons.location_on_outlined,size: 18,),
                      //             contentPadding: EdgeInsets.only(bottom: 5,left: 10),
                      //             border: InputBorder.none,
                      //             hintStyle: GoogleFonts.poppins(
                      //                 fontSize: 10, color: Colors.black)),
                      //       ),
                      //     ),
                      //
                      //   ],
                      // ),
                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.timelapse,),
                          SizedBox(width: 5,),

                          Text('24 min',style: GoogleFonts.poppins(fontSize: 18),)
                        ],
                      )
                    ],
                  )
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50,right: 50),
                child: GestureDetector(
                  onTap: ()async{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Saved",
                        style: GoogleFonts.poppins(),
                      ),
                    ));
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GMaps()));
                  },
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xff77E77B),
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Save",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),


        ],
      ),
    );
  }
}
