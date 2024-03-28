import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:sohoj_kart/common/widgets/loaders/animation_loader.dart';
import 'package:sohoj_kart/features/shop/controllers/order_controller.dart';
import 'package:sohoj_kart/navigation_menu.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/cloud_helper_function.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class SKOrderListItems extends StatelessWidget {
  const SKOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          ///Nothing found widget
          final emptyWidget = SKAnimationLoaderWidget(
            text: 'Whoops! No Orders Yet',
            animation: SKImages.successLottieAnimation,
            showAction: true,
            onActionPressed: () {
              NavigationMenuController.instance.selectedIndex.value = 0;
              Get.off(() => const NavigationMenu());
            },
          );

          ///Helper function: Handle Loader, No Record, or error message
          final response = SKCloudHelperFunctions.checkMultipleRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);

          if (response != null) return response;

          ///Record found
          final orders = snapshot.data!;

          return ListView.separated(
            shrinkWrap: true,
            itemCount: orders.length,
            itemBuilder: (_, index) {
              final order = orders[index];
              return SKRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(SKSizes.md),
                backgroundColor: darkMode ? SKColors.dark : SKColors.light,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Row 1
                    Row(
                      children: [
                        ///Icon
                        const Icon(Iconsax.ship),
                        const SizedBox(width: SKSizes.spaceBtwItems / 2),

                        ///Status and Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.orderStatusText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                      color: SKColors.primary,
                                      fontWeightDelta: 1,
                                    ),
                              ),
                              Text(
                                order.formattedOrderDate,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.arrow_right_34,
                            size: SKSizes.iconSm,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: SKSizes.spaceBtwItems),

                    ///Row -2
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              ///Icon
                              const Icon(Iconsax.tag),
                              const SizedBox(width: SKSizes.spaceBtwItems / 2),

                              ///Status and Date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text(
                                      order.id,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              ///Icon
                              const Icon(Iconsax.calendar),
                              const SizedBox(width: SKSizes.spaceBtwItems / 2),

                              ///Status and Date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Shipping Date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                    Text(
                                      order.formattedDeliveryDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) =>
                const SizedBox(height: SKSizes.spaceBtwItems),
          );
        });
  }
}
