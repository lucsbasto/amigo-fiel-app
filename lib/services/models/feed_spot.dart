import 'package:amigo_fiel/utils/format-cep.dart';

import 'address.dart';
import 'user.dart';
import 'company.dart';
import 'image.dart';

class FeedSpot {
  String id;
  bool isFull;
  User? filledBy;
  User? createdBy;
  double latitude;
  double longitude;
  String landmark;
  Address? address;
  String? fullAddress;
  List<User>? likedBy;
  List<Image>? images;
  Company? sponsoredBy;
  FeedSpot({
    required this.id,
    required this.isFull,
    this.filledBy,
    this.createdBy,
    required this.latitude,
    required this.longitude,
    required this.landmark,
    required this.likedBy,
    this.images,
    this.sponsoredBy,
    this.address,
    this.fullAddress,
  });

  // LatLng toLatLng() {
  //   return LatLng(latitude, longitude);
  // }

  factory FeedSpot.fromJson(Map<String, dynamic> json) {
    return FeedSpot(
      id: json['id'],
      isFull: json['isFull'],
      filledBy: null,
      createdBy: null,
      latitude: json['latitude'],
      longitude: json['longitude'],
      landmark: json['landmark'],
      likedBy: [],
      images: Image.fromJsonList(json['images']),
      sponsoredBy: null,
      address: Address.fromJson(json['address']),
      fullAddress: getFullAddress(json['address']),
    );
  }

  static String getFullAddress(Map<String, dynamic> json) {
    if (json['id'] != null) {
      final cep = formatCEP(json['cep']);
      return "${json['street']} ${json['number']} \n${cep} ${json['block']}";
    }
    return '';
  }
}
