import 'package:flutter/material.dart';
import 'package:sohoj_kart/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
class SKOverallProductRating extends StatelessWidget {
  const SKOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              SKRatingProgressIndicator(text: '5', value: 1.0),
              SKRatingProgressIndicator(text: '4', value: 0.7),
              SKRatingProgressIndicator(text: '3', value: 0.5),
              SKRatingProgressIndicator(text: '2', value: 0.3),
              SKRatingProgressIndicator(text: '1', value: 0.1),
            ],
          ),
        )
      ],
    );
  }
}