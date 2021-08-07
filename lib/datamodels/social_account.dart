part of 'base.dart';

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
