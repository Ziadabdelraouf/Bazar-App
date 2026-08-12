import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTestPage extends StatelessWidget {
  const MapTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Test'),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(30.0444, 31.2357),
          zoom: 14,
        ),
        onMapCreated: (GoogleMapController controller) {
          debugPrint('===== GOOGLE MAP CREATED =====');
        },
        markers: {
          const Marker(
            markerId: MarkerId('test'),
            position: LatLng(30.0444, 31.2357),
          ),
        },
      ),
    );
  }
}