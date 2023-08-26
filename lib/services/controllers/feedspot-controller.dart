import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:amigo_fiel/services/models/feed_spot.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FeedspotController extends GetxController {
  final RxList<FeedSpot> feedspots = <FeedSpot>[].obs;
  final Rx<FeedSpot?> _feedSpot = Rx<FeedSpot?>(null);
  FeedSpot? get feedspot => _feedSpot.value;

  final RxBool isPanelVisible = false.obs;
  final PanelController panelController = PanelController();

  void showPanel() {
    isPanelVisible.value = true;
    panelController.show();
  }

  void hidePanel() {
    isPanelVisible.value = false;
    panelController.hide();
  }

  void openPanel() {
    isPanelVisible.value = true;
    panelController.open();
  }

  void closePanel() {
    isPanelVisible.value = false;
    panelController.close();
  }

  @override
  void onInit() {
    super.onInit();
    getAll();
  }

  Future<void> getAll() async {
    final client = http.Client();
    try {
      var response = await client.get(Uri.parse('http://192.168.100.7:3000/feedspots'));
      final responseJson = jsonDecode(response.body);
      List<FeedSpot> newFeedspots = [];
      for (var json in responseJson) {
        final feedspot = FeedSpot.fromJson(json);
        newFeedspots.add(feedspot);
      }
      feedspots.assignAll(newFeedspots); // Atualiza a lista de feedspots
      print(feedspots);
    } catch (error) {
      print(error);
    } finally {
      client.close();
    }
  }

  setFeedspot(FeedSpot feedspot) {
    _feedSpot.value = feedspot;

    showPanel();
    openPanel();
  }
}
