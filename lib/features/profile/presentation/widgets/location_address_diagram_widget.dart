import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationAddressDiagramWidget extends StatefulWidget {
  const LocationAddressDiagramWidget({
    super.key,
    required this.selectedLocation,
    required this.onLocationSelected,
  });

  final LatLng selectedLocation;
  final ValueChanged<LatLng> onLocationSelected;

  @override
  State<LocationAddressDiagramWidget> createState() =>
      _LocationAddressDiagramWidgetState();
}

class _LocationAddressDiagramWidgetState
    extends State<LocationAddressDiagramWidget> {
  String? _mapStyle;

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
  }

  Future<void> _loadMapStyle() async {
    try {
      final style = await rootBundle.loadString(
        'assets/map_styles/location_map_style.json',
      );

      if (!mounted) return;

      setState(() {
        _mapStyle = style;
      });
    } catch (error) {
      debugPrint('Could not load Google Maps style: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: GoogleMap(
          key:ValueKey(locale.languageCode),
          style: _mapStyle,
          initialCameraPosition: CameraPosition(
            target: widget.selectedLocation,
            zoom: 13,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('selected-location'),
              position: widget.selectedLocation,
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueViolet,
              ),
              draggable: true,
              onDragEnd: widget.onLocationSelected,
            ),
          },
          onTap: widget.onLocationSelected,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          myLocationButtonEnabled: false,
          compassEnabled: false,
          rotateGesturesEnabled: false,
          tiltGesturesEnabled: false,
          buildingsEnabled: false,
        ),
      ),
    );
  }
}