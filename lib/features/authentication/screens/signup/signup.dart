import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/login_signup/form_divider.dart';
import 'package:sohoj_kart/common/widgets/login_signup/social_buttons.dart';
import 'package:sohoj_kart/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            CupertinoIcons.back,
            color: SKHelperFunctions.isDarkMode(context)
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),
          child: Column(
            children: [
              ///Title
              Text(
                SKTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: SKSizes.spaceBtwSections),

              ///Form
              const SKSignUpForm(),
              const SizedBox(height: SKSizes.spaceBtwSections),

              ///Divider
              SKFormDivider(dividerText: SKTexts.orSignUpWith.capitalize!),
              const SizedBox(height: SKSizes.spaceBtwSections),

              /// Social Buttons
              const SKSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
