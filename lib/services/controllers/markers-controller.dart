import 'dart:async';
import 'package:amigo_fiel/services/controllers/feedspot-controller.dart';
import 'package:amigo_fiel/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerController {
  BitmapDescriptor markerIconFull = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIconEmpty = BitmapDescriptor.defaultMarker;

  MarkerController() {
    addCustomMarker();
  }

  Future addCustomMarker() async {
    try {
      markerIconFull =
          await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(1, 1)), customMarkerFull);
      markerIconEmpty =
          await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(1, 1)), customMarkerEmpty);
    } catch (e) {
      print("Erro ao carregar ícones de marcadores: $e");
    }
  }

  Future<List<Marker>> getMarkers() async {
    final FeedspotController feedspotController = new FeedspotController();
    final feedspots = await feedspotController.getAll();
    final List<Marker> markers = [];
    for (var feedSpot in feedspots) {
      Marker? marker;
      marker = Marker(
        markerId: MarkerId(feedSpot.id.toString()),
        position: LatLng(feedSpot.latitude, feedSpot.longitude),
        icon: feedSpot.isFull ? markerIconFull : markerIconEmpty,
        onTap: () {},
      );
      markers.add(marker);
    }
    return markers;
  }
}
