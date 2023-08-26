import 'package:amigo_fiel/services/controllers/feedspot-controller.dart';
import 'package:amigo_fiel/services/controllers/markers-controller.dart';
import 'package:amigo_fiel/services/controllers/panel-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
  final MarkerController markerController = Get.put(MarkerController());
  final FeedspotController feedspotController = Get.put(FeedspotController());
  final PanelControllerMixin panelController = Get.put(PanelControllerMixin());
  MapWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<MarkerController>(
        builder: (controller) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: controller.currentPosition.value,
              zoom: 15,
            ),
            onCameraMove: (position) {
              controller.updatePosition(position.target);
            },
            markers: Set<Marker>.of(controller.markers),
            onTap: (position) {
              panelController.closePanel();
            },
          );
        },
      ),
    );
  }
}
