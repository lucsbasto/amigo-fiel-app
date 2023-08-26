import 'dart:ffi';

import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelControllerMixin extends GetxController {
  final RxBool isPanelVisible = false.obs;
  final PanelController controller = PanelController();
  bool get isVisible => isPanelVisible.value;

  void showPanel() {
    isPanelVisible.value = true;
    controller.show();
  }

  void hidePanel() {
    isPanelVisible.value = false;
    controller.hide();
  }

  void openPanel() {
    isPanelVisible.value = true;
    controller.open();
  }

  void closePanel() {
    isPanelVisible.value = false;
    controller.close();
  }
}
