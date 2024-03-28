import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sohoj_kart/data/repositories/user/user_repository.dart';
import 'package:sohoj_kart/features/authentication/screens/login/login.dart';
import 'package:sohoj_kart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:sohoj_kart/features/authentication/screens/signup/verify_email.dart';
import 'package:sohoj_kart/navigation_menu.dart';
import 'package:sohoj_kart/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:sohoj_kart/utils/exceptions/firebase_exceptions.dart';
import 'package:sohoj_kart/utils/exceptions/format_exceptions.dart';
import 'package:sohoj_kart/utils/exceptions/platform_exceptions.dart';
import 'package:sohoj_kart/utils/local_storage/storage_utility.dart';

//Which function we create
/*
1. Screen Redirect
2.login with email and password
3. register with email and password
4. send email verification
5.send reset password reset email
7. sign in with google
8. logout

9. delete account
 */

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //Get authenticated user data
  User? get authUser => _auth.currentUser;

  ///Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  ///Function to redirect relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      //If the user is logged in
      if (user.emailVerified) {
        //Initialize User Specific Storage
        await SKLocalStorage.init(user.uid);


        //If the user's email is verified. navigate tot he main Navigation Screen
        Get.offAll(() => const NavigationMenu());
      } else {
        //If the user's email is not verified, navigate to the VerifyEmailScreen
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      //Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);

      //Check if it's the first time launching the app
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

/* -------------- Email and Password Sign in ----------------------------------*/

  ///[EmailAuthentication] -- Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SKFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const SKFormatExceptions();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[EmailAuthentication] -- signIn
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SKFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const SKFormatExceptions();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[EmailAuthentication] -- Email Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw SKFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const SKFormatExceptions();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[UserAuthentication] -- Forgot Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw SKFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const SKFormatExceptions();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[UserAuthentication] -- Re Authenticate user
  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      //Create a credential
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      //Re- authenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw SKFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const SKFormatExceptions();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /*---------------- Google and Facebook Sign in ---------------------*/

  ///[EmailAuthentication] -- Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      //Trigger the authentication floe
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      //Create a new Credentials
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      //Once signed in, return the UserCredentials
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw SKFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const SKFormatExceptions();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[EmailAuthentication] -- Facebook

  /*------------------ Logout --------------------------------------*/

  ///[LogoutUser] -- logout
  Future<void> logout() async {
    try {
      //await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw SKFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const SKFormatExceptions();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /* -----------------------Delete Account -------------------------*/
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw SKFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const SKFormatExceptions();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
