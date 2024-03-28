import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/chips/sk_choice_chip.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:sohoj_kart/common/widgets/texts/product_price_text.dart';
import 'package:sohoj_kart/common/widgets/texts/product_title_text.dart';
import 'package:sohoj_kart/common/widgets/texts/section_heading.dart';
import 'package:sohoj_kart/features/shop/controllers/product/variation_controller.dart';
import 'package:sohoj_kart/features/shop/models/products/product_model.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          ///Selected Attributes Pricing and Descriptions
          //Displaying variation price and stock when some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            SKRoundedContainer(
              backgroundColor: darkMode ? SKColors.darkerGrey : SKColors.grey,
              child: Padding(
                padding: const EdgeInsets.all(SKSizes.sm),
                child: Column(
                  children: [
                    ///Title Price and Stack Status
                    Row(
                      children: [
                        const SKSectionHeading(
                          sectionText: 'Variation',
                          showButton: false,
                        ),
                        const SizedBox(width: SKSizes.spaceBtwItems),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SKProductTitleText(
                                  title: 'Price :',
                                  isSmallText: true,
                                ),

                                ///Actual Price
                                if (controller
                                        .selectedVariation.value.salePrice >
                                    0)
                                  Text(
                                    '\$${controller.selectedVariation.value.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                const SizedBox(width: SKSizes.spaceBtwItems),

                                ///Sale Price
                                SKProductPriceText(
                                    price: controller.getVariationPrice()),
                              ],
                            ),
                            Row(
                              children: [
                                const SKProductTitleText(
                                  title: 'Stock :',
                                  isSmallText: true,
                                ),
                                Text(
                                  controller.variationStockStatus.value,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),

                    ///variation Description
                    SKProductTitleText(
                      title:
                          controller.selectedVariation.value.description ?? '',
                      isSmallText: true,
                      maxLine: 4,
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: SKSizes.spaceBtwItems),

          ///Attributes
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!
                  .map(
                    (attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SKSectionHeading(
                            sectionText: attribute.name ?? ' ',
                            showButton: false),
                        const SizedBox(height: SKSizes.spaceBtwItems / 2),
                        Obx(() => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  attributeValue;
                              final available = controller
                                  .getAttributesAvailabilityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(attributeValue);
                              return SKChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributesSelected(
                                              product,
                                              attribute.name ?? '',
                                              attributeValue);
                                        }
                                      }
                                    : null,
                              );
                            }).toList()))
                      ],
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}
