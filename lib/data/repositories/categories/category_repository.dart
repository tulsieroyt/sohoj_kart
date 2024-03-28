import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/data/services/firebase/firebase_storage_service.dart';
import 'package:sohoj_kart/features/shop/models/category_model.dart';
import 'package:sohoj_kart/utils/exceptions/firebase_exceptions.dart';
import 'package:sohoj_kart/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  ///Variable
  final _db = FirebaseFirestore.instance;

  ///Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something  went wrong. Please try again';
    }
  }

  ///Get sub categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db
          .collection('Categories')
          .where('ParentId', isEqualTo: categoryId)
          .get();

      final result =
          snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();

      return result;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  ///Upload Categories to the Cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      //Upload all the categories along with their images
      final storage = Get.put(SKFirebaseStorageService());

      //Loop through each category
      for (var category in categories) {
        //Get image link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        //Upload image to get its url
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        //Assign URL to Category image attribute
        category.image = url;

        //Store Category in Firestore
        await _db
            .collection('Categories')
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
