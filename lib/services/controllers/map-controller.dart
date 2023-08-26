import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final Rx<LatLng> currentPosition = LatLng(-10.2077868, -48.346478).obs;
  final RxList<Marker> markers = <Marker>[].obs;

  VoidCallback? showPanelCallback;
  VoidCallback? hidePanelCallback;
  VoidCallback? openPanelCallback;
  VoidCallback? closePanelCallback;

  void updatePosition(LatLng newPosition) {
    currentPosition.value = newPosition;
  }

  void showPanel() {
    showPanelCallback?.call();
  }

  void hidePanel() {
    hidePanelCallback?.call();
  }

  void openPanel() {
    openPanelCallback?.call();
  }

  void closePanel() {
    closePanelCallback?.call();
  }
}
