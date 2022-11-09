import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class showMap extends StatefulWidget {
  const showMap({Key? key}) : super(key: key);

  @override
  State<showMap> createState() => _showMapState();
}

class _showMapState extends State<showMap> {
  late GoogleMapController mapController;
  static LatLng _center = const LatLng(23.816591317488747, 90.41560944927275);
  static LatLng _anotherLocation = const LatLng(23.7088442434317, 90.40608696755409);

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
        markers: {dhakaMarker,dhakaMarkerSecond},
        mapType: MapType.terrain,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center,zoom: 14.0),),
        floatingActionButton: FloatingActionButton.extended(onPressed: _goToDU, label: Text("Dhaka University"),
          icon: Icon(Icons.place)),
    );
  }
  static final CameraPosition duPosition = CameraPosition(target: LatLng(23.7341698,90.3905615),
      zoom: 14.0,
  bearing: 150.0,
  tilt: 35.0);
  
   Future<void>_goToDU()async{
    GoogleMapController controller = await mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(duPosition));
   }

  Marker dhakaMarker = Marker(markerId: MarkerId("Dhaka"),
    position: _center,
    infoWindow: InfoWindow(title: "Dhaka",snippet: "This is the capital of BD"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  );
  Marker dhakaMarkerSecond = Marker(markerId: MarkerId("AhsanManZil"),
    position: _anotherLocation,
    infoWindow: InfoWindow(title: "Ahsan Manzil Museum",snippet: "Historical Place"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  );
}
