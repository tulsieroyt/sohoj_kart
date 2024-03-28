import 'package:flutter/material.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/device/device_utility.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class SKTabBar extends StatelessWidget implements PreferredSizeWidget {
  ///If you want to add the background color in the TabBar you have the wrap
  ///To do that you need [PreferredSize] and have the make it [PreferredSizeWidget]
  const SKTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return Material(
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: SKColors.primary,
        labelColor: darkMode ? SKColors.white : SKColors.dark,
        unselectedLabelColor: SKColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SKDeviceUtils.getAppBarHeight());
}
