
import 'package:flutter/material.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: HexColor("#CE568B"),
        // title: Text(
        //   "LADY NAME",
        //   style:  TextStyle(
        //       fontWeight: FontWeight.bold,
        //       color: primaryColor,
        //       fontSize: 25.0
        //
        //   ),
        // ),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: HexColor("#CE568B"),
              borderRadius: BorderRadius.vertical(
               bottom: Radius.circular(300.0),
              )
            ),
            child:Stack(
              children: [
                Center(
                  child: Text(
                    "LADY NAME",
                    style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25.0

                    ),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    ); 
  }
}
