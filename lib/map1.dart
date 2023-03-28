import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import '../search.dart';
import 'package:geocoding/geocoding.dart';
String closestPharmcy="";
  double calculateDistance(lat1, lon1, lat2, lon2){
  var p = 0.017453292519943295;
  var a = 0.5 - cos((lat2 - lat1) * p)/2 + 
        cos(lat1 * p) * cos(lat2 * p) * 
        (1 - cos((lon2 - lon1) * p))/2;
  return 12742 * asin(sqrt(a));
}
class map_page extends StatefulWidget {
  List firstlist;
  map_page({Key? key, this.animationController, required this.firstlist})
      : super(key: key);

  final AnimationController? animationController;
  @override
  _map_pageState createState() => _map_pageState();
}

class _map_pageState extends State<map_page> {
 
  late GoogleMapController googleMapController;
LatLng ibnsLocation = LatLng(32.22162, 35.26231); 
LatLng  nourpharmacyLocation = LatLng(32.22108, 35.25068); 
LatLng  rafedyapharmacyLocation = LatLng(32.2216, 35.23847); 
  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(32.231351, 35.227660), zoom: 14);


  Set<Marker> markers = {};
  @override
   void initState() {
closestPharmcy="";
    super.initState();
  }
  Widget build(BuildContext context) {
print("nift");
print(widget.firstlist[1]);
print("ibb");
print(widget.firstlist[2]);
print("raa");
print(widget.firstlist[3]);

  
    return Scaffold(
     appBar: AppBar(
          backgroundColor: Color(0xFF91c4aa),
          toolbarHeight: MediaQuery.of(context).size.height * 0.10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 32, 88, 65),
            ),
            onPressed: () {

                            Navigator.pop(context);
            },
          ),
       title: Container(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.07,
            child: Image.asset(
              'assets/images/logoo1-removebg-preview.png',
              fit: BoxFit.cover,
            ),

            //
          ),
        ),
          actions: [
          ]),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      
      floatingActionButton: FloatingActionButton.extended(
      backgroundColor: Color(0xFF91c4aa),
        onPressed: () async {
          Position position = await _determinePosition();

          googleMapController
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));


          markers.clear();

          markers.add(Marker(
            markerId:  MarkerId('currentLocation'),position: LatLng(position.latitude, position.longitude),
            
                infoWindow: InfoWindow( //popup info 
          title: 'my location ',
          snippet: '',
        ),
             icon: BitmapDescriptor.defaultMarker,
      
  
            )
            
            
       );
       double distance1=calculateDistance(  ibnsLocation.latitude,ibnsLocation.longitude,
        position.latitude, position.longitude);
         double distance2=calculateDistance(  nourpharmacyLocation.latitude,nourpharmacyLocation.longitude,
 position.latitude, position.longitude);
  double distance3=calculateDistance(  rafedyapharmacyLocation.latitude,rafedyapharmacyLocation.longitude,
 position.latitude, position.longitude);
      if((widget.firstlist[2]) && (widget.firstlist[1])&&( widget.firstlist[3])){ 
         if(distance1<(distance2)){ if((distance1<distance3))closestPharmcy="IBN-SINA PHARMACY ";}
         if(distance2<(distance1)){ if ((distance2<distance3))closestPharmcy="Nour alyousef pharmacy";}
         if(distance3<(distance2) ){if ((distance3<distance1))closestPharmcy="Rafidia pharmacy ";}
        }
  else if((widget.firstlist[1])&&(widget.firstlist[2])&&(!widget.firstlist[3])){
  if(distance1<(distance2))closestPharmcy="IBN-SINA PHARMACY ";
  if(distance2<(distance1)) closestPharmcy="Nour alyousef pharmacy";
}
  else if((widget.firstlist[1])&&( widget.firstlist[3])&&(!widget.firstlist[2])){
  if(distance2<(distance3))closestPharmcy="Nour alyousef pharmacy ";
  if(distance3<(distance2)) closestPharmcy="Rafidia pharmacy ";
}
  else if((widget.firstlist[3])&&( widget.firstlist[2])&&(!widget.firstlist[1])){
  if(distance3<(distance1))closestPharmcy="Rafidia pharmacy ";
  if(distance1<(distance3)) closestPharmcy="IBN-SINA PHARMACY ";
}
 else if((widget.firstlist[1])&&( !widget.firstlist[3])&&(!widget.firstlist[2])){
 closestPharmcy="Nour alyousef pharmacy";
}
 else if((widget.firstlist[2])&&( !widget.firstlist[3])&&(!widget.firstlist[1])){
 closestPharmcy="IBN-SINA PHARMACY ";
}
else if((widget.firstlist[3])&&( !widget.firstlist[1])&&(!widget.firstlist[2])){
 closestPharmcy="Rafidia pharmacy ";
}
else{
  closestPharmcy=" ";
}
 
if(widget.firstlist[2]){
     markers.add(Marker( //add distination location marker
        markerId: MarkerId(ibnsLocation.toString()),
        position: ibnsLocation, //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'IBN-SINA PHARMACY ',
          snippet: 'PHARMACY',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));}
      if(widget.firstlist[1]){
        markers.add(Marker( //add distination location marker
        markerId: MarkerId(nourpharmacyLocation.toString()),
        position: nourpharmacyLocation, //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'Nour alyousef pharmacy ',
          snippet: 'PHARMACY',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));}
      if(widget.firstlist[3]){
          markers.add(Marker( //add distination location marker
        markerId: MarkerId(rafedyapharmacyLocation.toString()),
        position: rafedyapharmacyLocation, //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'Rafidia pharmacy ',
          snippet: 'PHARMACY',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));}
          setState(() {});

        },
        label: const Text("Current Location", style: TextStyle(
                        color: Color.fromARGB(255, 35, 88, 68),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),),
        icon: const Icon(Icons.location_history),
      ),
           bottomNavigationBar: Container(
        height: 37,
        alignment: Alignment.center,
        child: Text(
            closestPharmcy, style: TextStyle(
                        color: Color.fromARGB(255, 35, 88, 68),
                        fontSize: 25,
                        fontWeight: FontWeight.w500),),
      ),
      
    );
   
   // po();
    
//      double distance1=calculateDistance(  ibnsLocation.latitude,ibnsLocation.longitude,
//  position.latitude, position.longitude);

  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

}
