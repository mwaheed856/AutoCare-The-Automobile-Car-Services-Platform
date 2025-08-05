// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class NearbyMechanicsMapScreen extends StatefulWidget {
//   @override
//   _NearbyMechanicsMapScreenState createState() => _NearbyMechanicsMapScreenState();
// }
//
// class _NearbyMechanicsMapScreenState extends State<NearbyMechanicsMapScreen> {
//   late GoogleMapController _mapController;
//   LatLng? _currentLocation;
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   Future<void> _getCurrentLocation() async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       await Geolocator.openLocationSettings();
//       return;
//     }
//
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
//       permission = await Geolocator.requestPermission();
//     }
//
//     if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
//       final position = await Geolocator.getCurrentPosition();
//       setState(() {
//         _currentLocation = LatLng(position.latitude, position.longitude);
//       });
//     }
//   }
//
//   void _launchNearbyMechanics() async {
//     if (_currentLocation == null) return;
//     final url = Uri.parse(
//       "https://www.google.com/maps/search/car+mechanic+near+me/@${_currentLocation!.latitude},${_currentLocation!.longitude},14z",
//     );
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Nearby Mechanics")),
//       body: _currentLocation == null
//           ? Center(child: CircularProgressIndicator())
//           : Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: _currentLocation!,
//               zoom: 14,
//             ),
//             onMapCreated: (controller) {
//               _mapController = controller;
//             },
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//           ),
//           Positioned(
//             bottom: 20,
//             left: 20,
//             right: 20,
//             child: ElevatedButton.icon(
//               icon: Icon(Icons.location_searching),
//               label: Text("Search Nearby Car Mechanics"),
//               onPressed: _launchNearbyMechanics,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
