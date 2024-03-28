import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sohoj_kart/data/repositories/authentication/authentication_repository.dart';
import 'package:sohoj_kart/features/authentication/models/user/user_model.dart';
import 'package:sohoj_kart/utils/exceptions/platform_exceptions.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Function to save user data to firebase firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const SKFormatExceptions();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  //Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const SKFormatExceptions();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  //Function to updates user details based on user ID
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection('Users')
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const SKFormatExceptions();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  //Function to  update any specific field in specific user collection
  Future<void> updateSpecificField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const SKFormatExceptions();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  //Function to  remove user record
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const SKFormatExceptions();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

//Upload any image -->
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const SKFormatExceptions();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
