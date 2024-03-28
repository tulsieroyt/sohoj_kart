import 'package:flutter/material.dart';

class SKProductTitleText extends StatelessWidget {
  const SKProductTitleText({
    super.key,
    required this.title,
    this.maxLine = 2,
    this.isSmallText = false,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final int maxLine;
  final bool isSmallText;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: isSmallText
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
