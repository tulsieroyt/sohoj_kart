import 'package:get/get.dart';
import 'package:sohoj_kart/features/authentication/screens/login/login.dart';
import 'package:sohoj_kart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:sohoj_kart/features/authentication/screens/password_configuration/forgot_password_screen.dart';
import 'package:sohoj_kart/features/authentication/screens/signup/signup.dart';
import 'package:sohoj_kart/features/authentication/screens/signup/verify_email.dart';
import 'package:sohoj_kart/features/personalization/screens/address/address_screen.dart';
import 'package:sohoj_kart/features/personalization/screens/profile/profile_screen.dart';
import 'package:sohoj_kart/features/personalization/screens/settings/settings.dart';
import 'package:sohoj_kart/features/shop/screens/checkout/checkout_screen.dart';
import 'package:sohoj_kart/features/shop/screens/home/home_screen.dart';
import 'package:sohoj_kart/features/shop/screens/order/order_screen.dart';
import 'package:sohoj_kart/features/shop/screens/product_reviews/product_reviews_screen.dart';
import 'package:sohoj_kart/features/shop/screens/shop/store_screen.dart';
import 'package:sohoj_kart/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:sohoj_kart/routes/routes.dart';

class AppRoutes{
  static final pages =[
    GetPage(name: SKRoutes.home, page: () => const HomeScreen()),
    GetPage(name: SKRoutes.store, page: () => const StoreScreen()),
    GetPage(name: SKRoutes.favourites, page: () => const WishListScreen()),
    GetPage(name: SKRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: SKRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: SKRoutes.order, page: () => const OrderScreen()),
    GetPage(name: SKRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: SKRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: SKRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: SKRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: SKRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: SKRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: SKRoutes.forgotPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: SKRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}