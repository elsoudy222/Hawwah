//
//
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hawwah/modules/search/cubit/search_cubit.dart';
// import 'package:hawwah/shared/components/components.dart';
//
// class SearchScreen extends StatelessWidget {
//   const SearchScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var formKey = GlobalKey<FormState>();
//     var searchController = TextEditingController();
//     return BlocProvider(
//   create: (context) => SearchCubit(),
//   child: BlocConsumer<SearchCubit, SearchStates>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(
//                 "البــحث",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold
//               ),
//             ),
//             centerTitle: true,
//
//           ),
//
//           body: Form(
//             key: formKey,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   defaultFormField(
//                       controller: searchController,
//                       keyboardType: TextInputType.text,
//                       label: "Search",
//                       prefix: Icons.search,
//                     validate: (String? value){
//                         if(value!.isEmpty){
//                           print("Enter text tot search");
//                         }
//                         return null;
//                     },
//                     onSubmit: (String text){
//                         SearchCubit.get(context).search(text);
//                     }
//                   ),
//                   SizedBox(height: 10.0,),
//                   if(state is SearchLoadingState)
//                   LinearProgressIndicator(),
//                   SizedBox(height: 10.0,),
//                   //if(state is SearchSuccessState)
//                   // Expanded(
//                   //   child: ListView.separated(
//                   //     physics: BouncingScrollPhysics(),
//                   //      itemBuilder: (context, index) => buildListProduct(
//                   //         SearchCubit.get(context).model.data.data[index],
//                   //       context,
//                   //       isOldPrice: false
//                   //     ),
//                   //     separatorBuilder: (context, index) => Container(
//                   //       height: 1,
//                   //       width: 1,
//                   //       color: Colors.grey,
//                   //     ),
//                   //    // itemCount: SearchCubit.get(context).model.data.data.length,
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     ),
// );
//   }
// }


import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hawwah/modules/search/search_doctor.dart';
import 'package:hawwah/modules/search/search_lape.dart';

import 'package:hawwah/shared/components/colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {

  final double? myLat,myLng;

  const SearchScreen({Key? key, this.myLat, this.myLng}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  initState() {
    addMarkers();
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



      // Container(
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.topCenter,
      //         end: Alignment.bottomCenter,
      //         colors: [
      //           Color.fromRGBO(248, 157, 185, 1.0),
      //           Color.fromRGBO(250, 250, 250, 1.0)
      //         ]),
      //   ),
      //   child: Stack(
      //     children: [
      //       // Container(
      //       //   width: double.infinity,
      //       //   height: double.infinity,
      //       //   decoration: const BoxDecoration(
      //       //     gradient: LinearGradient(
      //       //         begin: Alignment.topCenter,
      //       //         end: Alignment.bottomCenter,
      //       //         colors: [
      //       //           Color.fromRGBO(236, 156, 184, 90.0),
      //       //           Color.fromRGBO(250, 250, 250,1.0),
      //       //         ]),
      //       //   ),
      //       // ),
      //       Padding(
      //         padding: const EdgeInsets.all(20.0),
      //         child: SingleChildScrollView(
      //           physics: BouncingScrollPhysics(),
      //           child: Padding(
      //             padding: const EdgeInsets.only(top: 150.0),
      //             child: Stack(
      //               children: [
      //                 Center(
      //                   child: Container(
      //                     height: 204,
      //                     width: 312,
      //                     decoration: BoxDecoration(
      //                       color: Colors.white,
      //                       borderRadius: BorderRadius.circular(10),
      //                     ),
      //                   ),
      //                 ),
      //                 Center(
      //                   child: Padding(
      //                     padding: const EdgeInsets.only(top: 2.0),
      //                     child: Container(
      //                       height: 200,
      //                       width: 310,
      //                       decoration: BoxDecoration(
      //                         color: HexColor('FAACC3'),
      //                         borderRadius: BorderRadius.circular(10),
      //                       ),
      //                       child: Center(
      //                         child: Row(
      //                           mainAxisSize: MainAxisSize.min,
      //                           children: [
      //                             Container(
      //                               height: 100,
      //                               width: 100,
      //                               child: IconButton(
      //                                   icon: Image.asset(
      //                                     'assets/icons/search_laboratory.png',
      //                                     fit: BoxFit.cover,
      //                                     width: 100,
      //                                     height: 100,
      //                                   ),
      //                                   onPressed: ()
      //                                   {
      //                                     Navigator.push(context, MaterialPageRoute(
      //                                         builder: (context)=>SearchLap()));
      //                                   }),
      //                             ),
      //                             SizedBox(
      //                               width: 20,
      //                             ),
      //                             Container(
      //                               height: 100,
      //                               width: 100,
      //                               child: IconButton(
      //                                   icon: Image.asset(
      //                                     'assets/icons/search_doctor.png',
      //                                     fit: BoxFit.cover,
      //                                     width: 100,
      //                                     height: 100,
      //                                   ),
      //                                   onPressed: ()
      //                                   {
      //                                     Navigator.push(context, MaterialPageRoute(
      //                                         builder: (context)=>SearchDoctor()));
      //                                   }),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Set<Marker> myMarkers = Set();

  addMarkers() async {
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
