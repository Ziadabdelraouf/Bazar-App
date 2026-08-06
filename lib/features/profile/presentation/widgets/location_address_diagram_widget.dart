import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationAddressDiagramWidget extends StatelessWidget {
  const LocationAddressDiagramWidget({
    super.key,
    required this.selectedLocation,
    required this.onLocationSelected,
  });

  final LatLng selectedLocation;
  final ValueChanged<LatLng> onLocationSelected;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: selectedLocation,
        zoom: 15,
      ),
      markers: {
        Marker(
          markerId: const MarkerId('selected-location'),
          position: selectedLocation,
          draggable: true,
          onDragEnd: onLocationSelected,
        ),
      },
      onTap: onLocationSelected,
      onMapCreated: (_) {
        debugPrint('Google Map created successfully');
      },
      zoomControlsEnabled: false,
      mapToolbarEnabled: false,
      myLocationButtonEnabled: false,
      compassEnabled: false,
    );
  }
}