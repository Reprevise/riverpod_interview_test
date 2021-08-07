part of 'base.dart';

class StatsValue {
  final int? rank;
  final double? percentile;
  final String displayName;
  final String? displayCategory;
  final String? category;
  final Map<String, dynamic> metadata;
  final String displayValue;
  final String displayType;

  StatsValue({
    this.rank,
    this.percentile,
    required this.displayName,
    required this.displayCategory,
    this.category,
    required this.metadata,
    required this.displayValue,
    required this.displayType,
  });

  factory StatsValue.fromMap(Map<String, dynamic> map) {
    return StatsValue(
      rank: map['rank'],
      percentile: map['percentile'],
      displayName: map['displayName'],
      displayCategory: map['displayCategory'],
      category: map['category'],
      metadata: Map<String, dynamic>.from(map['metadata']),
      displayValue: map['displayValue'],
      displayType: map['displayType'],
    );
  }
}
