import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class showMap extends StatefulWidget {
  const showMap({Key? key}) : super(key: key);

  @override
  State<showMap> createState() => _showMapState();
}

class _showMapState extends State<showMap> {
  late GoogleMapController mapController;
  static LatLng _center = const LatLng(23.7104, 90.4074);

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
        markers: {dhakaMarker},
        mapType: MapType.terrain,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center,zoom: 14.0),),
    );
  }
  Marker dhakaMarker = Marker(markerId: MarkerId("Dhaka"),
    position: _center,
    infoWindow: InfoWindow(title: "Dhaka",snippet: "This is the capital of BD"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  );
}
