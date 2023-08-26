import 'package:amigo_fiel/services/controllers/feedspot-controller.dart';
import 'package:amigo_fiel/services/controllers/panel-controller.dart';
import 'package:amigo_fiel/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class MarkerController extends GetxController {
  final Rx<LatLng> currentPosition = LatLng(-10.2077868, -48.346478).obs;
  final FeedspotController _feedspotController = Get.put(FeedspotController());
  final PanelControllerMixin panelController = Get.put(PanelControllerMixin());
  BitmapDescriptor markerIconFull = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIconEmpty = BitmapDescriptor.defaultMarker;
  final RxList<Marker> markers = <Marker>[].obs;

  void updatePosition(LatLng newPosition) {
    currentPosition.value = newPosition;
  }

  @override
  void onInit() {
    super.onInit();
    addCustomMarker();
    getMarkers();
  }

  Future<void> addCustomMarker() async {
    try {
      markerIconFull = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(1, 1)),
        customMarkerFull,
      );
      markerIconEmpty = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(1, 1)),
        customMarkerEmpty,
      );
    } catch (e) {
      print("Erro ao carregar ícones de marcadores: $e");
    }
  }

  Future<void> getMarkers() async {
    try {
      await _feedspotController.getAll();
      final feedspots = _feedspotController.feedspots;
      final List<Marker> newMarkers = [];
      for (var feedspot in feedspots) {
        Marker marker = Marker(
          markerId: MarkerId(feedspot.id.toString()),
          position: LatLng(feedspot.latitude, feedspot.longitude),
          icon: feedspot.isFull ? markerIconFull : markerIconEmpty,
          onTap: () {
            _feedspotController.setFeedspot(feedspot);
            panelController.openPanel();
          },
        );
        newMarkers.add(marker);
      }
      markers.assignAll(newMarkers);
    } catch (e) {
      print(e);
    }
  }
}
