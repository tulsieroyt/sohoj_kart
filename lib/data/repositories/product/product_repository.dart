import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/products/product_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  ///Variable
  final _db = FirebaseFirestore.instance;

  ///Get the featured product lists
  Future<List<ProductModel>> fetchProductData() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();

      return snapshot.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something  went wrong. Please try again';
    }
  }

  ///Get the featured product lists
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();

      return snapshot.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something  went wrong. Please try again';
    }
  }

  ///Get the based on Query
  Future<List<ProductModel>> fetchProductByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something  went wrong. Please try again';
    }
  }

  ///Get the product wishlist
  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productIds) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      return snapshot.docs
          .map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something  went wrong. Please try again';
    }
  }

  ///Get the product lists for specific brand
  Future<List<ProductModel>> getProductForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something  went wrong. Please try again';
    }
  }

  ///Get the  product lists for specific category
  Future<List<ProductModel>> getProductForCategory(
      {required String categoryId, int limit = -1}) async {
    try {
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      //Extract productIds from the documents
      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['productId'] as String)
          .toList();

      //Query to get all documents where the brandId is in the limit of brandIds, FilePath.documentId to query documents in Collection
      final productQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      //Extract brand names or other relevant data from the documents
      List<ProductModel> products = productQuery.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      throw SKFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw SKPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something  went wrong. Please try again';
    }
  }
}
