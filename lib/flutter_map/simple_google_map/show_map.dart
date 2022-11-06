import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class showMap extends StatefulWidget {
  const showMap({Key? key}) : super(key: key);

  @override
  State<showMap> createState() => _showMapState();
}

class _showMapState extends State<showMap> {
  late GoogleMapController mapController;
  final LatLng _center = LatLng(23.7104, 90.4074);

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Map"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center,zoom: 14.0),),
    );
  }
}
