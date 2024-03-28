import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  //Empty Helper Function
  static CategoryModel empty() => CategoryModel(
        id: '',
        name: '',
        image: '',
        parentId: '',
        isFeatured: false,
      );

  ///Convert model to json structure so that you can store data to Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'isFeatured': isFeatured,
      'ParentId': parentId
    };
  }

  ///Map Json oriented document snapshot from Firebase to CategoryModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      //Map JSON data to model
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
      );
    }else{
      return CategoryModel.empty();
    }
  }
}
