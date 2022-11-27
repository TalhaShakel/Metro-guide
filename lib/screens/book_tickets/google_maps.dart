import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'location.dart';
class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  TextEditingController _searchcontroller = TextEditingController();
  static final Marker _station1 = Marker(markerId: MarkerId('_kLakePlex'),
  infoWindow: InfoWindow(title: 'Metro Station 1'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(24.824633,46.790478),
  );
  static final Marker _station2 = Marker(markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Metro Station 2'),
    icon: BitmapDescriptor.defaultMarker,

    position: LatLng(24.7422,46.8570),
  );
  static final Marker _station3 = Marker(markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Metro Station 3'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(24.686667,46.74),
  );
  static final Marker _station4 = Marker(markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Metro Station 3'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(24.7620,46.6038),
  );
  static final Marker _station5 = Marker(markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Metro Station 3'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(24.8343,46.6792),
  );

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
      target:LatLng(37.43296465331129,-122.088323578787921),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414
  );
  static final CameraPosition _kGooglePlex = CameraPosition(
      target:LatLng(24.8343,46.6792),
    zoom: 9.8
  );
  static final Polyline _kPolyline =
  Polyline(polylineId: PolylineId('_kPolyline'), width: 5, points: [
    LatLng(24.824633, 46.790478),
    LatLng(24.7422, 46.8570),
    LatLng(24.686667, 46.74),
    LatLng(24.7620, 46.6038),
    LatLng(24.8343, 46.6792),
  ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _searchcontroller,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              hintText: 'Search By City',
                            ),
                            onChanged: (value) {
                              print(value);
                            },
                          ),
                        ),
                        IconButton(onPressed: ()async{
                          var place = await LocationService().getPlace(_searchcontroller.text);
                           _getoPlace(place);
                        },
                            icon:Icon(Icons.search) )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 400,
                child: GoogleMap(
                  polylines: {_kPolyline},
                  markers: {
                 _station1,
                    _station2,
                    _station3,
                    _station4,
                    _station5
                  },
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller){
                    _controller.complete(controller);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(onPressed: _gerthelake, label: Text('To the Lake'),
      // icon: Icon(Icons.directions_boat),
      // ),
    );
  }
  Future<void> _getoPlace(Map<String,dynamic> place)async{
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat,lng),zoom: 9.8)
    ));
  }

}
