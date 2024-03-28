import 'package:flutter/material.dart';

class SKSectionHeading extends StatelessWidget {
  const SKSectionHeading({
    super.key,
    this.textColor ,
    required this.sectionText,
    this.buttonText = 'View all',
    this.onPressed,
    this.showButton = true,
  });

  final Color? textColor;
  final String sectionText;
  final String buttonText;
  final void Function()? onPressed;
  final bool showButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionText,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showButton)
          TextButton(
            onPressed: onPressed,
            child:
            Text(buttonText, style: Theme.of(context).textTheme.bodySmall),
          ),
      ],
    );
  }
}