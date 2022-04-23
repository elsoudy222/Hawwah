import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:hexcolor/hexcolor.dart';

import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  final Widget widget;

  const SplashScreen({Key? key, required this.widget}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  initState() {
    super.initState();
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(248, 157, 185, 1.0),
              Color.fromRGBO(250, 250, 250, 1.0)
            ]),
      ),
      child: SplashScreenView(
        backgroundColor: HexColor("#FAACC3"),
        duration: 6000,
        speed: 200,
        navigateRoute: widget.widget,
        imageSrc: "assets/images/logo.png",
        imageSize: 500,
        // text: "حَوَّاء ",
        // textStyle: const TextStyle(
        //     color: Colors.pink,
        //     fontSize: 50.0
        // ),
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