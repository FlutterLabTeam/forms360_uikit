// To parse this JSON data, do
//
//     final clockLocation = clockLocationFromJson(jsonString);

import 'dart:convert';

ClockLocation clockLocationFromJson(String str) =>
    ClockLocation.fromJson(json.decode(str));

String clockLocationToJson(ClockLocation data) => json.encode(data.toJson());

class ClockLocation {
  final double latitude;
  final double longitude;
  final DateTime timestamp;

  ClockLocation({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  ClockLocation copyWith({
    double? latitude,
    double? longitude,
    DateTime? timestamp,
  }) =>
      ClockLocation(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        timestamp: timestamp ?? this.timestamp,
      );

  factory ClockLocation.fromJson(Map<String, dynamic> json) {

    final time = json["timestamp"];
    final latitude = json["latitude"];
    final longitude = json["longitude"];

    

    return ClockLocation(
        timestamp: time is DateTime ? time : time?.toDate(),
        latitude: latitude?.toDouble(),
        longitude: longitude?.toDouble(),
      );
  }

  factory ClockLocation.fromJsonHive(Map<String, dynamic> json) =>
      ClockLocation(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        timestamp: DateTime.parse(json["timestamp"]),
      );

  factory ClockLocation.init() => ClockLocation(
        latitude: 0,
        longitude: 0,
        timestamp: DateTime.now(),
      );

  Map<String, dynamic> toJsonHive() => {
        "latitude": latitude,
        "longitude": longitude,
        "timestamp": timestamp.toIso8601String(),
      };

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "timestamp": timestamp,
      };
}
