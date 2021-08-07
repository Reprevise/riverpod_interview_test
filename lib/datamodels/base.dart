part 'platform_info.dart';
part 'segment.dart';
part 'social_account.dart';
part 'stats_value.dart';
part 'user_info.dart';

class BaseStats {
  final PlatformInfo platformInfo;
  final UserInfo userInfo;
  final Map<String, dynamic> metadata;
  final List<Segment> segments;

  BaseStats({
    required this.platformInfo,
    required this.userInfo,
    required this.metadata,
    required this.segments,
  });

  factory BaseStats.fromMap(Map<String, dynamic> map) {
    return BaseStats(
      platformInfo: PlatformInfo.fromMap(map['platformInfo']),
      userInfo: UserInfo.fromMap(map['userInfo']),
      metadata: Map<String, dynamic>.from(map['metadata']),
      segments: List<Segment>.from(
        map['segments']?.map((x) => Segment.fromMap(x)),
      ),
    );
  }
}
