import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hawwah/modules/search/search_screen.dart';
import 'package:hawwah/shared/components/colors.dart';

class SearchDoctor extends StatefulWidget {
  final double? myLat,myLng;

  const SearchDoctor({Key? key, this.myLat, this.myLng}) : super(key: key);
  @override
  State<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.myLat!, widget.myLng!),
                zoom: 10,
              ),
              myLocationEnabled: true,
              tiltGesturesEnabled: true,
              //compassEnabled: true,

             // scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              markers:myMarkers,
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
                      icon:  Icon(
                        Icons.arrow_back_ios,
                        color:thirdColor,
                        size: 30,
                      ),
                    ),
                    const Spacer(),
                    const Image(
                      image: AssetImage('assets/icons/search_doctor.png'),
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

  Future<void> addMarkers() async {
    myMarkers.add( const Marker(
      markerId:  MarkerId("Said"),
      position:  LatLng(30.0541558938057, 31.346532475689095),

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
