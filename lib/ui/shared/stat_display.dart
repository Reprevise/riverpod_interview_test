import 'package:flutter/material.dart';

import '../../datamodels/base.dart';
import 'theme.dart';

class StatDisplay extends StatelessWidget {
  final StatsValue value;

  const StatDisplay({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const percentileStyle = TextStyle(
      color: gold,
      fontWeight: FontWeight.normal,
    );

    const rankStyle = TextStyle(
      color: gold,
      fontWeight: FontWeight.w700,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(value.displayName),
        Text(
          value.displayValue,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (value.percentile != null && value.rank != null) ...[
          if (value.rank! < 100) ...[
            Text.rich(
              TextSpan(
                text: '#${value.rank} ',
                style: rankStyle,
                children: [
                  TextSpan(
                    text: 'Top ${value.percentile}%',
                    style: percentileStyle,
                  ),
                ],
              ),
            ),
          ] else ...[
            Text(
              'Top ${value.percentile}%',
              style: percentileStyle,
            ),
          ],
        ],
      ],
    );
  }
}
