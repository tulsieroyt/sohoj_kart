import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utility.dart';
class SKRatingProgressIndicator extends StatelessWidget {
  const SKRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: SKDeviceUtils.getScreenWidth(context) * 0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation(SKColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}