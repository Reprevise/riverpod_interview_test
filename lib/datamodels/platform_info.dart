part of 'base.dart';

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
