import 'dart:async';

import 'package:find_it/features/map/get_location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static Position? position;
  Completer<GoogleMapController> _mapController = Completer();
  static final CameraPosition _myCurrentCameraPosition = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude), zoom: 17);
  Future<void> _getCurrentLocation() async {
    await MyLocation.getCurrentLocation();
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
    });
  }
  Future<void> _goToMyCurrentLocation()async{
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_myCurrentCameraPosition));
  }
@override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: position != null ?GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          onMapCreated: (controller){
            _mapController.complete(controller);
          },
          initialCameraPosition: _myCurrentCameraPosition
      ) : const Center(child: CircularProgressIndicator(color: Colors.blue,),),
          floatingActionButton: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: (){
                _goToMyCurrentLocation();
              },
              child: const Icon(Icons.place ,color: Colors.white,),
            ),

    ),
     );
  }
}
