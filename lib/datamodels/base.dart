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

class PlatformInfo {
  final String platformSlug;
  final String? platformUserId;
  final String platformUserHandle;
  final String platformUserIdentifier;
  final String avatarUrl;

  PlatformInfo({
    required this.platformSlug,
    required this.platformUserId,
    required this.platformUserHandle,
    required this.platformUserIdentifier,
    required this.avatarUrl,
  });

  factory PlatformInfo.fromMap(Map<String, dynamic> map) {
    return PlatformInfo(
      platformSlug: map['platformSlug'],
      platformUserId: map['platformUserId'],
      platformUserHandle: map['platformUserHandle'],
      platformUserIdentifier: map['platformUserIdentifier'],
      avatarUrl: map['avatarUrl'],
    );
  }
}

class UserInfo {
  final int? userId;
  final bool isPremium;
  final bool isVerified;
  final bool isInfluencer;
  final bool isPartner;
  final String? countryCode;
  final String? customAvatarUrl;
  final String? customHeroUrl;
  final List<SocialAccount> socialAccounts;
  final int pageviews;
  final bool? isSuspicious;

  UserInfo({
    this.userId,
    required this.isPremium,
    required this.isVerified,
    required this.isInfluencer,
    required this.isPartner,
    required this.countryCode,
    required this.customAvatarUrl,
    this.customHeroUrl,
    this.socialAccounts = const [],
    required this.pageviews,
    this.isSuspicious,
  });

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      userId: map['userId'],
      isPremium: map['isPremium'],
      isVerified: map['isVerified'],
      isInfluencer: map['isInfluencer'],
      isPartner: map['isPartner'],
      countryCode: map['countryCode'],
      customAvatarUrl: map['customAvatarUrl'],
      customHeroUrl: map['customHeroUrl'],
      socialAccounts: List<SocialAccount>.from(
        map['socialAccounts']?.map((x) => SocialAccount.fromMap(x)),
      ),
      pageviews: map['pageviews'],
      isSuspicious: map['isSuspicious'],
    );
  }
}

class SocialAccount {
  final String platformSlug;
  final String? platformUserHandle;
  final String platformUserIdentifier;

  SocialAccount({
    required this.platformSlug,
    this.platformUserHandle,
    required this.platformUserIdentifier,
  });

  factory SocialAccount.fromMap(Map<String, dynamic> map) {
    return SocialAccount(
      platformSlug: map['platformSlug'],
      platformUserHandle: map['platformUserHandle'],
      platformUserIdentifier: map['platformUserIdentifier'],
    );
  }
}

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
