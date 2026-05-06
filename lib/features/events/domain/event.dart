import 'package:flutter/foundation.dart';

@immutable
class Event {
  final String id;
  final String title;
  final String description;
  final DateTime dateTime;
  final String location;
  final String coverImageUrl;
  final String hostId;
  final List<String> guestIds;
  final String privacy;

  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.location,
    required this.coverImageUrl,
    required this.hostId,
    required this.guestIds,
    required this.privacy,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dateTime: DateTime.parse(json['date_time']),
      location: json['location'],
      coverImageUrl: json['cover_image_url'],
      hostId: json['host_id'],
      guestIds: List<String>.from(json['guest_ids'] ?? []),
      privacy: json['privacy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date_time': dateTime.toIso8601String(),
      'location': location,
      'cover_image_url': coverImageUrl,
      'host_id': hostId,
      'guest_ids': guestIds,
      'privacy': privacy,
    };
  }
}
