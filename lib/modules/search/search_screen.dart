
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hawwah/modules/search/search_doctor.dart';
import 'package:hawwah/modules/search/search_lab.dart';

import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key,}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  @override
  initState() {
    _getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Color.fromRGBO(236, 156, 184, 90.0),
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: const Text(
          'البحث',
        ),
      ),
      body:
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(248, 157, 185, 1.0),
                Color.fromRGBO(250, 250, 250, 1.0)
              ]),
        ),
        child: Stack(
          children: [
            // Container(
            //   width: double.infinity,
            //   height: double.infinity,
            //   decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter,
            //         colors: [
            //           Color.fromRGBO(236, 156, 184, 90.0),
            //           Color.fromRGBO(250, 250, 250,1.0),
            //         ]),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 204,
                          width: 312,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            height: 200,
                            width: 310,
                            decoration: BoxDecoration(
                              color: HexColor('FAACC3'),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    child: IconButton(
                                        icon: Image.asset(
                                          'assets/icons/search_laboratory.png',
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 100,
                                        ),
                                        onPressed: ()
                                        async{
                                          SharedPreferences preferences = await SharedPreferences.getInstance();
                                          preferences.setString('type', 'laboratory');
                                          navigateToAndFinish(
                                              context,
                                              SearchLab(
                                                myLat: double.parse(preferences.getString("lat").toString()),
                                                myLng: double.parse(preferences.getString("lng").toString()),
                                              )
                                          );
                                        }),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    child: IconButton(
                                        icon: Image.asset(
                                          'assets/icons/search_doctor.png',
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 100,
                                        ),
                                        onPressed: ()
                                        async{
                                          SharedPreferences preferences = await SharedPreferences.getInstance();
                                          preferences.setString('type', 'doctor');
                                          navigateToAndFinish(
                                            context,
                                              SearchDoctor(
                                                myLat: double.parse(preferences.getString("lat").toString()),
                                                myLng: double.parse(preferences.getString("lng").toString()),
                                              )
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  final Location location = Location();
  Future<void> _getLocation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      final LocationData _locationResult = await location.getLocation();
      preferences.setString("lat", _locationResult.latitude.toString());
      preferences.setString("lng", _locationResult.longitude.toString());
      print(preferences.getString("lat"));
      print(preferences.getString("lng"));
    }
    on PlatformException catch (err) {
      print("------ get current location ------");
    }
  }

}
