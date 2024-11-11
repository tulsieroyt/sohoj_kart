import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:sohoj_kart/features/shop/controllers/category_controller.dart';
import 'package:sohoj_kart/features/shop/screens/sub_category/sub_categories.dart';
import 'package:sohoj_kart/utils/shimmer/category_shimmer.dart';

class SKHomeCategories extends StatelessWidget {
  const SKHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) {
        return const SKCategoryShimmerEffect();
      }
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
            child: Text('No Data Found!',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.white)));
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            print('This is reached');
            final category = categoryController.featuredCategories[index];
            return SKVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => SubCategoryScreen(category: category)),
            );
          },
        ),
      );
    });
  }
}
