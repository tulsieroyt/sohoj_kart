import 'package:flutter/material.dart';
import 'package:sohoj_kart/common/widgets/images/circular_images.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';

class SKVerticalImageText extends StatelessWidget {
  const SKVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = SKColors.white,
    this.backgroundColor,
    this.isNetworkImage = true,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: SKSizes.spaceBtwItems),
        child: Column(
          children: [
            SKCircularImage(
              image: image,
              fit:BoxFit.cover,
              padding: 1,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
            ),
            const SizedBox(height: SKSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
