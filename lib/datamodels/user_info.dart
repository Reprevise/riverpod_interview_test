part of 'base.dart';

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
