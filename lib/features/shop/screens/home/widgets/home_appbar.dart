import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/appbar/appbar.dart';
import 'package:sohoj_kart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:sohoj_kart/features/personalization/controllers/user/user_controller.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';

import '../../../../../utils/shimmer/shimmer_effect.dart';

class SKHomeAppBar extends StatelessWidget {
  const SKHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return SKAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SKTexts.homeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: SKColors.grey),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                return const SKShimmerEffect(width: 80, height: 15);
              } else {
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: SKColors.white),
                );
              }
            },
          )
        ],
      ),
      actions: const [
        SKCartCounterIcon(
          iconColor: SKColors.white,
        )
      ],
    );
  }
}
