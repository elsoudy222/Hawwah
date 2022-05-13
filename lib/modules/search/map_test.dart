import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hawwah/models/place_details.dart';
import 'package:hawwah/models/places_suggestion.dart';
import 'package:hawwah/modules/search/cubit/search_cubit.dart';
import 'package:hawwah/modules/search/location_helper.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:uuid/uuid.dart';

import '../../models/place_directions_model.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  List<PlaceSuggestion> places = [];

  Completer<GoogleMapController> _mapController = Completer();

  FloatingSearchBarController floatingSearchBarController =
  FloatingSearchBarController();
  GlobalKey<FormState> floatingSearchBarKey = GlobalKey<FormState>();
  static Position? position;

  // Variables for getPlacesLocation///
  Set<Marker> markers = {};
  late PlaceSuggestion placeSuggestion;
  late Place selectedPlace;
  late Marker searchedPlaceMarker;
  late Marker currentLocationMarker;
  late CameraPosition goToSearchedForPlacePosition;



  void addMarkers()  {
    markers.add( const Marker(
      markerId:  MarkerId("Said"),
      position:  LatLng(30.0541558938057, 31.346532475689095),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:  "Said Said Said Said Said Said Said Said Said Said ",
        snippet:  "This is a marker that has a info window",

        //TODO: add onTap

      ),




      //TODO: add icon


    ));
    markers.add(const Marker(
      markerId: MarkerId("user"),
      position: LatLng(31.87633, 30.99056),
    ));
    markers.add(const Marker(
      markerId: MarkerId("Doctor"),
      position: LatLng(31.83633, 30.90056),
    ));
    markers.add(const Marker(
        markerId: MarkerId("Labs"),
        position: LatLng(31.222,31.877)));

  }



  // these variables for getDirections
  PlaceDirections? placeDirections;
  var progressIndicator = false;
  late List<LatLng> polylinePoints;
  var isSearchedPlaceMarkerClicked = false;
  var isTimeAndDistanceVisible = false;
  late String time;
  late String distance;



  void buildCameraNewPosition() {
    goToSearchedForPlacePosition = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      target: LatLng(
        selectedPlace.result.geometry.location.lat,
        selectedPlace.result.geometry.location.lng,
      ),
      zoom: 13,
    );
  }

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      bearing: 0.0,
      tilt: 0.0,
      zoom: 14.0);

  Future<void> _getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentPosition().whenComplete(() {
      setState(() {});
    });
  }

  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _myCurrentLocationCameraPosition,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        setState(() {
          _mapController.complete(controller);
        });
      },
      markers: markers,
      polylines: placeDirections != null
          ? {
        Polyline(
          polylineId: const PolylineId("my_polyline"),
          //visible: true,
          points: polylinePoints,
          width: 3,
          color: Colors.red,
        ),
      } : {}

    );
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery
            .of(context)
            .orientation == Orientation.portrait;
    return FloatingSearchBar(
        key: floatingSearchBarKey,
        controller: floatingSearchBarController,
        elevation: 6,
        hintStyle: const TextStyle(fontSize: 20, color: Colors.grey),
        queryStyle: const TextStyle(fontSize: 18),
        hint: 'البحث عن طبيب ....',
        border: const BorderSide(style: BorderStyle.none),
        margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
        padding: const EdgeInsets.fromLTRB(2, 0, 30, 0),
        height: 52,
        iconColor: thirdColor,
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: const Duration(milliseconds: 600),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: isPortrait ? 600 : 600,
        debounceDelay: const Duration(milliseconds: 500),
        progress: progressIndicator,
        onQueryChanged: (query) {
          getPlacesSuggestions(query);
        },
        onFocusChanged: (_) {
          // hid distance and time:
          setState(() {
            isTimeAndDistanceVisible = false;
          });
        },
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
              icon: Icon(Icons.place, color: thirdColor),
              onPressed: () {},
            ),
          )
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildSuggestionBloc(),
                  buildSelectedPlaceLocationBloc(),
                  buildDirectionsBloc(),
                ]),
          );
        });
  }

  Widget buildDirectionsBloc(){
    return BlocListener<SearchCubit, SearchStates>(
        listener: (context, state) {
          if (state is PlacesDirectionsLoadedState) {
              placeDirections = (state).placeDirections;

              getPolylinePoints();
          }
        },
      child: Container(),

    );
  }
  
  void getPolylinePoints() {
    polylinePoints = placeDirections!.polylinePoints.map((e) => LatLng(e.latitude, e.longitude)).toList();
  }

  Widget buildSelectedPlaceLocationBloc() {
    return BlocListener<SearchCubit, SearchStates>(
      listener: (context, state) {
        if (state is PlacesDetailsLoadedState) {
          selectedPlace = (state).place;
          goToMySearchedLocation();
          getDirections();
        }

      },
      child: Container(),
    );
  }

  void getDirections(){
    BlocProvider.of<SearchCubit>(context).emitPlacesDirections(
       LatLng(position!.latitude, position!.longitude),
      LatLng(selectedPlace.result.geometry.location.lat, selectedPlace.result.geometry.location.lng),
    );
  }

  Future<void> goToMySearchedLocation() async {
    buildCameraNewPosition();
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(goToSearchedForPlacePosition));
    buildSearchedPlaceMarker();
  }

  void buildSearchedPlaceMarker(){
    searchedPlaceMarker = Marker(
      position: goToSearchedForPlacePosition.target,
      markerId:  MarkerId('1'),
      onTap: () {
        buildCurrentLocationMarker();
        // Show Time And Distance :
        setState(() {
          isSearchedPlaceMarkerClicked = true;
          isTimeAndDistanceVisible = true;
        });
      },
      infoWindow: InfoWindow(
        title: "${placeSuggestion.description}",
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
    );
    addMarkerToMarkersAndUpdateUi(searchedPlaceMarker);
  }

  void buildCurrentLocationMarker() {
    currentLocationMarker = Marker(
      position: LatLng(position!.latitude, position!.longitude),
      markerId: const MarkerId('2'),
      onTap: () {},
      infoWindow: const InfoWindow(
        title: "Your Current Location",
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    );
    addMarkerToMarkersAndUpdateUi(currentLocationMarker);
  }



  void addMarkerToMarkersAndUpdateUi(Marker marker) {

    setState(() {
      markers.add(marker);
    });
  }

  void getPlacesSuggestions(String query) {
    final sessionToken = const Uuid().v4();
    BlocProvider.of<SearchCubit>(context)
        .emitPlacesSuggestion(query, sessionToken);
  }

  Widget buildSuggestionBloc() {
    return BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
          if (state is PlacesLoadedState) {
            places = (state).places;
            if (places.length != 0) {
              return buildPlacesList();
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        });
  }

  Widget buildPlacesList() {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap: () async {
            placeSuggestion = places[index];
            floatingSearchBarController.close();
            getSelectedPlaceLocation();
            polylinePoints.clear();
            // remove all markers :
          },
          child: PlaceItem(
            suggestion: places[index],
          ),
        );
      },
      itemCount: places.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }

  void getSelectedPlaceLocation() async {
    final sessionToken = const Uuid().v4();
    BlocProvider.of<SearchCubit>(context).emitPlacesDetailsLocation(
      placeSuggestion.placeId,
      sessionToken,
    );
  }

  @override
  initState() {
    super.initState();
    _getMyCurrentLocation();
    addMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 3),
        child: FloatingActionButton(
            backgroundColor: thirdColor,
            child: const Icon(
              Icons.place,
              color: Colors.white,
            ),
            onPressed: (){
              _goToMyCurrentLocation();
              // setState(() {
              //   polylinePoints.clear();
              //   isTimeAndDistanceVisible = false;
              //
              // });

            }),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
        position != null
            ? buildMap()
            : const Center(
          child: CircularProgressIndicator(),
        ),
        buildFloatingSearchBar(),
        isSearchedPlaceMarkerClicked
        ?
        DistanceAndTime(
          isTimeAndDistanceVisible: isTimeAndDistanceVisible,
          placeDirections: placeDirections,
        )
            : Container(),

      ],),
    );
  }
}

/// Search Place item result:

class PlaceItem extends StatelessWidget {
  final PlaceSuggestion suggestion;

  const PlaceItem({Key? key, required this.suggestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subTitle = suggestion.description
        .replaceAll(suggestion.description.split(",")[0], "");
    return Container(
        width: double.infinity,
        margin: const EdgeInsetsDirectional.all(8),
        padding: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.place, color: thirdColor),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${suggestion.description.split(",")[0]}\n",
                      style: TextStyle(
                        color: thirdColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: subTitle.substring(2),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}



class DistanceAndTime extends StatelessWidget {
  final PlaceDirections? placeDirections;
  final isTimeAndDistanceVisible;

  const DistanceAndTime(
      {Key? key, this.placeDirections, required this.isTimeAndDistanceVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isTimeAndDistanceVisible,
      child: Positioned(
        top: 0,
        bottom: 500,
        left: 20,
        right: 20,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                color: Colors.white,
                child: ListTile(
                  dense: true,
                  horizontalTitleGap: 0,
                  leading: Icon(
                    Icons.access_time_filled,
                    color: thirdColor,
                    size: 30,
                  ),
                  title: Text(
                    placeDirections!.totalDuration,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   width: 30,
            // ),
            Flexible(
              flex: 1,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                color: Colors.white,
                child: ListTile(
                  dense: true,
                  horizontalTitleGap: 0,
                  leading: Icon(
                    Icons.directions_car_filled,
                    color:thirdColor,
                    size: 30,
                  ),
                  title: Text(
                    placeDirections!.totalDistance,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}