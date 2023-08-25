import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:amigo_fiel/services/models/feed_spot.dart';

class FeedspotController {
  Future<List<FeedSpot>> getAll() async {
    final client = http.Client();
    final List<FeedSpot> feedspots = [];
    try {
      var response = await client.get(Uri.parse('http://192.168.100.7:3000/feedspots'));
      final responseJson = jsonDecode(response.body);
      for (var json in responseJson) {
        final feedspot = FeedSpot.fromJson(json);
        feedspots.add(feedspot);
      }
      return feedspots;
    } catch (error) {
      print(error);
      return [];
    }
  }
}
