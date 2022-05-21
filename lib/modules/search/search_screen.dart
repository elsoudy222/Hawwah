import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/modules/search/cubit/search_cubit.dart';
import 'package:hawwah/modules/search/map_test.dart';
import 'package:hawwah/modules/search/repository/maps_repo.dart';
import 'package:hawwah/modules/search/search_doctor.dart';
import 'package:hawwah/modules/search/search_lab.dart';

import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/network/remote/search_helper.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  initState() {
    super.initState();
    // _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromRGBO(236, 156, 184, 90.0),
        backgroundColor: primaryColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeLayout()));
          },
        ),
        title: const Text(
          'البحث',
        ),
      ),
      body: Container(
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

                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: HexColor('FAACC3'),
                              borderRadius: BorderRadius.circular(35),
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
                                        onPressed: () {
                                          navigateToAndFinish(
                                            context,
                                            BlocProvider(
                                              create: (context) => SearchCubit(MapsRepo(SearchHelper())),
                                              child: SearchLab(),
                                            ),
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
                                        onPressed: ()  {
                                          navigateToAndFinish(
                                            context,
                                            BlocProvider(
                                              create: (context) => SearchCubit(MapsRepo(SearchHelper())),
                                              child: SearchDoctor(),
                                            ),
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

  // final Location location = Location();
  //
  // Future<void> _getLocation() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   try {
  //     final LocationData _locationResult = await location.getLocation();
  //     preferences.setString("lat", _locationResult.latitude.toString());
  //     preferences.setString("lng", _locationResult.longitude.toString());
  //     print(preferences.getString("lat"));
  //     print(preferences.getString("lng"));
  //   } on PlatformException catch (err) {
  //     print("------ get current location ------");
  //   }
  // }
}

