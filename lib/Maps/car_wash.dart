import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CarWashShopsMapPage extends StatelessWidget {
  final List<LatLng> shopLocations = [
    LatLng(31.5149, 74.3433),
    LatLng(31.5342, 74.3561),
    LatLng(31.5215, 74.4000),
    LatLng(31.4952, 74.3705),
    LatLng(31.5500, 74.3200),
    LatLng(31.5245, 74.3720),
    LatLng(31.5100, 74.3900),
    LatLng(31.5300, 74.3400),
    LatLng(31.5180, 74.3580),
    LatLng(31.5020, 74.3650),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(31.5204, 74.3587),
            initialZoom: 13,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.auto_care_project',
            ),
            MarkerLayer(
              markers: fakeTyreShops.map((shop) {
                return Marker(
                  point: LatLng(shop['lat'], shop['lng']),
                  width: 100,
                  height: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/wash.png',
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 3,
                              offset: Offset(1, 1),
                            )
                          ],
                        ),
                        child: Text(
                          shop['name'],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
final List<Map<String, dynamic>> fakeTyreShops = [
  {
    'name': 'misbah car wash',
    'lat': 31.5204,
    'lng': 74.3587,
  },
  {
    'name': 'AutoGrip wash',
    'lat': 31.5140,
    'lng': 74.3579,
  },
  {
    'name': 'Rubber wash Shop',
    'lat': 31.5172,
    'lng': 74.3650,
  },
  {
    'name': 'waheed car wash',
    'lat': 31.5231,
    'lng': 74.3612,
  },
];
