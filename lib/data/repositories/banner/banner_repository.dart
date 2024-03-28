import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/features/shop/models/banner_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variable
  final _db = FirebaseFirestore.instance;

  /// Get all banners
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('PromoBanner')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something  went wrong. Please try again';
    }
  }
}
