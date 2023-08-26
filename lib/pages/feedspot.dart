import 'package:amigo_fiel/services/controllers/panel-controller.dart';
import 'package:amigo_fiel/widgets/features/feedspots/feedspot-info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:amigo_fiel/widgets/features/maps.dart';

class FeedSpotInfo extends StatelessWidget {
  const FeedSpotInfo({
    Key? key,
    required this.defaultBackgroundColor,
    required this.defaultIconColor,
  }) : super(key: key);

  final Color defaultBackgroundColor;
  final Color defaultIconColor;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PanelControllerMixin>(
      builder: (panelController) {
        return SlidingUpPanel(
          minHeight: 0,
          controller: panelController.controller,
          backdropEnabled: true,
          color: defaultBackgroundColor,
          boxShadow: const [BoxShadow(blurRadius: 8, color: Color.fromRGBO(0, 0, 0, 0.75))],
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          panel: FeedSpotPanel(
            defaultIconColor: defaultIconColor,
          ),
          body: MapWidget(),
        );
      },
    );
  }
}
