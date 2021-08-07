part of 'base.dart';

class Segment {
  final String type;
  final Map<String, dynamic> attributes;
  final Map<String, dynamic> metadata;
  final DateTime expiryDate;
  final Map<String, StatsValue> stats;

  Segment({
    required this.type,
    required this.attributes,
    required this.metadata,
    required this.expiryDate,
    required this.stats,
  });

  factory Segment.fromMap(Map<String, dynamic> map) {
    return Segment(
      type: map['type'],
      attributes: Map<String, dynamic>.from(map['attributes']),
      metadata: Map<String, dynamic>.from(map['metadata']),
      expiryDate: DateTime.parse(map['expiryDate']),
      stats: Map<String, StatsValue>.from(
        (map['stats'] as Map).map(
          (key, value) => MapEntry(
            key,
            StatsValue.fromMap(value),
          ),
        ),
      ),
    );
  }
}
