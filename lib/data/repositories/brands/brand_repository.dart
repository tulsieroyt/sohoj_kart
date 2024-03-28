import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/features/shop/models/products/brand_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  //Variable
  final _db = FirebaseFirestore.instance;

  /// -- Get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (e) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something  went wrong. Please try again';
    }
  }

  /// Get Brand for category
  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      print(categoryId);
      //Query to get all documents where category matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      //Extract brandIds from the document
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['brandId'] as String)
          .toList();

      for (var id in brandIds) {
        print(id);
      }

      //Query to gel all documents where the brandId is in the list of brandsIds, FieldPath.documentId to query documents in Collection
      final brandQuery = await _db
          .collection('Brands')
          .where('Id', whereIn: brandIds)
          .limit(2)
          .get();

      //Extract brand names or other relevant data from the documents
      List<BrandModel> brands =
          brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on FormatException catch (e) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something  went wrong. Please try again';
    }
  }
}
