
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/bindings/general_bindings.dart';
import 'package:sohoj_kart/routes/app_routes.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,

      ///Showing Loader or Circular Indicator while Authintication

      home: const Scaffold(
        backgroundColor: SKColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
