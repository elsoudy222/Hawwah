import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hawwah/modules/search/search_screen.dart';

import '../../shared/components/colors.dart';
import '../../shared/components/components.dart';

class SearchLab extends StatefulWidget {
  final double? myLat,myLng;

  const SearchLab({Key? key, this.myLat, this.myLng}) : super(key: key);
  @override
  State<SearchLab> createState() => _SearchLabState();
}

class _SearchLabState extends State<SearchLab> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  initState() {
    addMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          body: Stack(
            children: [
              // Map Setting
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.myLat!, widget.myLng!),
                    zoom: 12,
                  ),
                  myLocationEnabled: false,
                  tiltGesturesEnabled: true,
                  compassEnabled: true,
                  scrollGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  // polylines: Set<Polyline>.of(polylines.values),
                  markers: myMarkers,
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      _controller.complete(controller);
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SearchScreen()));
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color:thirdColor,
                            size: 30,
                          ),
                        ),


                        Spacer(),
                        Image(
                          image: AssetImage('assets/icons/search_laboratory.png'),
                          height: 70.0,
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ],
          )),
    );
  }


  Set<Marker> myMarkers = {};

  addMarkers() async {
    myMarkers.add( Marker(
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      markerId: MarkerId("Me"),
      position: LatLng(31.5754741, 30.9092202),
    ));
    myMarkers.add(const Marker(
      markerId: MarkerId("user"),
      position: LatLng(31.87633, 30.99056),
    ));
    myMarkers.add(const Marker(
      markerId: MarkerId("Doctor"),
      position: LatLng(31.83633, 30.90056),
    ));
    myMarkers.add(const Marker(
        markerId: MarkerId("Labs"),
        position: LatLng(31.222,31.877)));
  }
}

