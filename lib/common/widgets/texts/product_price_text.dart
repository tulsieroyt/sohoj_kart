import 'package:flutter/material.dart';
class SKProductPriceText extends StatelessWidget {
  const SKProductPriceText({
    super.key,
    required this.price,
    this.isLarge = false,
    this.currencySign = '\$',
    this.maxLine = 1,
    this.lineThrough = false,
  });

  final String currencySign, price;
  final int maxLine;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$currencySign$price',
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
          decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
          decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}