import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  ///Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  ///Convert Model to json structure
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'ProductCount': productsCount
    };
  }

  ///Convert json to model data
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['Id'] ?? '',
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        productsCount: data['ProductCount'] ?? '');
  }

  ///Convert json to model data
  factory BrandModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return BrandModel(
          id: data['Id'] ?? '',
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          isFeatured: data['IsFeatured'] ?? false,
          productsCount: data['ProductCount'] ?? '');
    } else {
      return BrandModel.empty();
    }
  }
}
