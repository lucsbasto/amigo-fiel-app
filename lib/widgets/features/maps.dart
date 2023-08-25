import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsWidget extends StatefulWidget {
  MapsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MapsWidget> createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      initialCameraPosition: CameraPosition(
        target: const LatLng(-10.2077868, -48.346478),
        zoom: 15,
      ),
      onCameraMove: (position) {},
      markers: Set<Marker>.of([]),
      onTap: (position) {},
    ));
  }
}
