import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/styles/spacing_styles.dart';
import 'package:sohoj_kart/common/widgets/login_signup/form_divider.dart';
import 'package:sohoj_kart/common/widgets/login_signup/social_buttons.dart';
import 'package:sohoj_kart/features/authentication/screens/login/widgets/login_form.dart';
import 'package:sohoj_kart/features/authentication/screens/login/widgets/login_header.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(Get.context!).unfocus(),
      child: const Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: SKSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SKLoginHeader(),
                SKLoginForm(),
                SKFormDivider(
                  dividerText: SKTexts.orSignInWith,
                ),
                SizedBox(
                  height: SKSizes.spaceBtwItems,
                ),

                /// -- Footer
                SKSocialButtons()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
