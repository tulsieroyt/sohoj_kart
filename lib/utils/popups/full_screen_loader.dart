import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

import '../../common/widgets/loaders/animation_loader.dart';

class SKFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: SKHelperFunctions.isDarkMode(Get.context!)
              ? SKColors.dark
              : SKColors.white,
          width: double.infinity,
          height: double.infinity,
          child:  Column(
            children: [
              const SizedBox(height: 250),
              SKAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}
