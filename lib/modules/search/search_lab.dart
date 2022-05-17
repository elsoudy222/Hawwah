import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hawwah/models/search/place_details.dart';
import 'package:hawwah/models/search/places_suggestion.dart';
import 'package:hawwah/modules/search/cubit/search_cubit.dart';
import 'package:hawwah/modules/search/location_helper.dart';
import 'package:hawwah/modules/search/search_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:uuid/uuid.dart';

import '../../models/search/place_directions_model.dart';
import 'widgets/distance_and_time.dart';
import 'widgets/place_item.dart';

class SearchLab extends StatefulWidget {
  const SearchLab({Key? key}) : super(key: key);

  @override
  State<SearchLab> createState() => _SearchLabState();
}

class _SearchLabState extends State<SearchLab> {
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

  @override
  initState() {
    super.initState();
    _getMyCurrentLocation();
    addMarkers();

  }



  void addMarkers() async {
    markers.add(  Marker(
      markerId:  MarkerId("Said"),
      position:  LatLng(position!.latitude, position!.longitude),
      //TODO: add ifo window
      infoWindow:  const InfoWindow(
        title:  "Said Said Said Said Said Said Said Said Said Said ",
        snippet:  "This is a marker that has a info window",

        //TODO: add onTap

      ),

      //TODO: add icon
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),


    ));
    markers.add(  Marker(
      markerId:  MarkerId("Said"),
      position:  LatLng(30.0541558938057, 31.346532475689095),
      //TODO: add ifo window
      infoWindow:  const InfoWindow(
        title:  "Said Said Said Said Said Said Said Said Said Said ",
        snippet:  "This is a marker that has a info window",

        //TODO: add onTap

      ),

      //TODO: add icon
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),


    ));
    markers.add(const Marker(
      markerId: MarkerId("user"),
      position: LatLng(30.061768001626994, 31.205321364966856),
    ));
    markers.add(const Marker(
      markerId: MarkerId("Doctor"),
      position: LatLng(30.10543804560771, 31.342990789628125),
    ));
    markers.add(const Marker(
        markerId: MarkerId("Labs"),
        position: LatLng(30.007670876789618, 31.187345161130615)));

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
        hint: 'البحث عن معمل للتحاليل ....',
        border: const BorderSide(style: BorderStyle.none),
        margins: const EdgeInsets.fromLTRB(20, 95, 20, 0),
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
          // setState(() {
          //
          // });

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
      LatLng(selectedPlace.result.geometry.location.lat,
          selectedPlace.result.geometry.location.lng),
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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 3),
        child: FloatingActionButton(
            backgroundColor: thirdColor,
            child: const Icon(
              Icons.my_location,
              color: Colors.white,
            ),
            onPressed: (){
              _goToMyCurrentLocation();
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
          Positioned(
            top: 10,
            left: 0,
            right: 0,

            child: Padding(
              padding: const EdgeInsets.all(15.0),
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
                        image: AssetImage('assets/icons/search_laboratory.png'),
                        height: 50.0,
                        width: 50.0,
                      ),

                    ],
                  ),

                ],
              ),
            ),
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





