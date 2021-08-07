import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../enums/platform.dart';

class PlatformButton extends StatelessWidget {
  final VoidCallback onTap;
  final PlatformType selectedPlatform;
  final PlatformType platform;

  const PlatformButton({
    Key? key,
    required this.onTap,
    required this.selectedPlatform,
    required this.platform,
  }) : super(key: key);

  final selBackgroundColor = const Color(0xFF484848);
  final unselBackgroundColor = const Color(0xFF495059);
  final unselForegroundColor = const Color(0xFFB4C1D9);
  final selForegroundColor = Colors.white;

  bool get isSelected => selectedPlatform == platform;

  String get imgPath {
    switch (platform) {
      case PlatformType.epic:
        return 'assets/epicgames-logo.svg';
      case PlatformType.origin:
        return 'assets/origin-logo.svg';
      case PlatformType.psn:
        return 'assets/psn-logo.svg';
      case PlatformType.steam:
        return 'assets/steam-logo.svg';
      case PlatformType.xbl:
        return 'assets/xbox-logo.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 40,
        child: Material(
          color: isSelected ? selBackgroundColor : unselBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                imgPath,
                color: isSelected ? selForegroundColor : unselForegroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
