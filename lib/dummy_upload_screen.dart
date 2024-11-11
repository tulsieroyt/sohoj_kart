import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'features/shop/models/brand_category_model.dart';

class DummyUploadScreen extends StatefulWidget {
  const DummyUploadScreen({super.key});

  @override
  State<DummyUploadScreen> createState() => _DummyUploadScreenState();
}

class _DummyUploadScreenState extends State<DummyUploadScreen> {
  List<String> categoryIds = ['2', '3', '7', '8', '9'];
  List<String> brandIds = ['12', '13', '14', '17', '18'];

  // Firestore instance
  final firestore = FirebaseFirestore.instance;

  // Create and upload each category-brand combination to Firestore

  Future<void> uplodaData() async {
    for (String categoryId in categoryIds) {
      for (String brandId in brandIds) {
        BrandCategoryModel brandCategory =
            BrandCategoryModel(brandId: brandId, categoryId: categoryId);
        await firestore
            .collection('BrandCategory')
            .add(brandCategory.toJson()); // Adds with a random ID
        print('added');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Upload Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //uplodaData();
          },
          child: const Text('Upload Data'),
        ),
      ),
    );
  }
}


