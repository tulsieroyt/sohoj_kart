import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UploadDummyData extends GetxController{
  static UploadDummyData get instance => Get.find();
  final productsData = [
    {
      "Brand": {
        "Id": "1",
        "Name": "Nike",
        "Image": "https://dummyimage.com/300.png/09f/fff",
        "IsFeatured": true,
        "ProductCount": 132
      },
      "CategoryId": "1",
      "Description": "Green Nike Sports Shoes",
      "Title": "Nike Sports Shoes",
      "Images": [
        "https://dummyimage.com/300.png/09f/fff",
        "https://dummyimage.com/300.png/09f/fff",
        "https://dummyimage.com/300.png/09f/fff",
        "https://dummyimage.com/300.png/09f/fff"
      ],
      "IsFeatured": true,
      "Price": 135,
      "ProductAttributes": [
        {
          "Name": "Color",
          "Values": ["Green", "Black", "Red"]
        },
        {
          "Name": "Size",
          "Values": ["EU 30", "EU 32", "EU 36"]
        }
      ],
      "ProductType": "ProductType.variable",
      "ProductVariations": [
        {
          "AttributeValues": {"Color": "Green", "Size": "EU 34"},
          "Description": "This is a Product for Green Nike Sports Shoes",
          "Id": "1",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 134,
          "SKU": "",
          "SalePrice": 122.6,
          "Stock": 34
        },
        {
          "AttributeValues": {"Color": "Black", "Size": "EU 36"},
          "Description": "This is a Product for Green Nike Sports Shoes",
          "Id": "1",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 134,
          "SKU": "",
          "SalePrice": 122.6,
          "Stock": 34
        },
        {
          "AttributeValues": {"Color": "Red", "Size": "EU 32"},
          "Description": "This is a Product for Green Nike Sports Shoes",
          "Id": "1",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 134,
          "SKU": "",
          "SalePrice": 122.6,
          "Stock": 34
        }
      ],
      "SKU": "GNSP001",
      "SalePrice": 30,
      "Stock": 15,
      "Thumbnail": "https://dummyimage.com/300.png/09f/fff"
    },
    {
      "Brand": {
        "Id": "3",
        "Name": "Puma",
        "Image": "https://dummyimage.com/300.png/09f/fff",
        "IsFeatured": true,
        "ProductCount": 85
      },
      "CategoryId": "3",
      "Description": "Red Puma Sneakers",
      "Title": "Puma Sneakers",
      "Images": [
        "https://dummyimage.com/300.png/09f/fff",
        "https://dummyimage.com/300.png/09f/fff",
        "https://dummyimage.com/300.png/09f/fff",
        "https://dummyimage.com/300.png/09f/fff"
      ],
      "IsFeatured": true,
      "Price": 90,
      "ProductAttributes": [
        {
          "Name": "Color",
          "Values": ["Red", "White", "Black"]
        },
        {
          "Name": "Size",
          "Values": ["EU 36", "EU 38", "EU 40"]
        }
      ],
      "ProductType": "ProductType.variable",
      "ProductVariations": [
        {
          "AttributeValues": {"Color": "Red", "Size": "EU 36"},
          "Description": "This is a Product for Red Puma Sneakers",
          "Id": "3",
          "CategoryId": "3",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 88,
          "SKU": "PMSK001-01",
          "SalePrice": 80,
          "Stock": 30
        },
        {
          "AttributeValues": {"Color": "Red", "Size": "EU 38"},
          "Description": "This is a Product for Red Puma Sneakers",
          "Id": "3",
          "CategoryId": "3",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 88,
          "SKU": "PMSK001-02",
          "SalePrice": 80,
          "Stock": 30
        },
        {
          "AttributeValues": {"Color": "Red", "Size": "EU 40"},
          "Description": "This is a Product for Red Puma Sneakers",
          "Id": "3",
          "CategoryId": "3",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 88,
          "SKU": "PMSK001-03",
          "SalePrice": 80,
          "Stock": 30
        }
      ],
      "SKU": "PMSK001",
      "SalePrice": 20,
      "Stock": 25,
      "Thumbnail": "https://dummyimage.com/300.png/09f/fff"
    },
    {
      "Brand": {
        "Id": "4",
        "Name": "Reebok",
        "Image": "https://dummyimage.com/300.png/09f/fff",
        "IsFeatured": true,
        "ProductCount": 75
      },
      "CategoryId": "4",
      "Description": "White Reebok Running Shoes",
      "Title": "Reebok Running Shoes",
      "Images": [
        "https://dummyimage.com/300.png/09f/fff",
        "https://dummyimage.com/300.png/09f/fff",
        "https://dummyimage.com/300.png/09f/fff",
        "https://dummyimage.com/300.png/09f/fff"
      ],
      "IsFeatured": true,
      "Price": 110,
      "ProductAttributes": [
        {
          "Name": "Color",
          "Values": ["White", "Blue", "Black"]
        },
        {
          "Name": "Size",
          "Values": ["EU 38", "EU 40", "EU 42"]
        }
      ],
      "ProductType": "ProductType.variable",
      "ProductVariations": [
        {
          "AttributeValues": {"Color": "White", "Size": "EU 38"},
          "Description": "This is a Product for White Reebok Running Shoes",
          "Id": "4",
          "CategoryId": "4",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 108,
          "SKU": "RBR001-01",
          "SalePrice": 100,
          "Stock": 45
        },
        {
          "AttributeValues": {"Color": "White", "Size": "EU 40"},
          "Description": "This is a Product for White Reebok Running Shoes",
          "Id": "4",
          "CategoryId": "4",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 108,
          "SKU": "RBR001-02",
          "SalePrice": 100,
          "Stock": 45
        },
        {
          "AttributeValues": {"Color": "White", "Size": "EU 42"},
          "Description": "This is a Product for White Reebok Running Shoes",
          "Id": "4",
          "CategoryId": "4",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 108,
          "SKU": "RBR001-03",
          "SalePrice": 100,
          "Stock": 45
        }
      ],
      "SKU": "RBR001",
      "SalePrice": 15,
      "Stock": 30,
      "Thumbnail": "https://dummyimage.com/300.png/09f/fff"
    },
    {
      "Brand": {
        "Id": "4",
        "Name": "Reebok",
        "Image": "https://dummyimage.com/300.png/09f/fff",
        "IsFeatured": true,
        "ProductCount": 75
      },
      "CategoryId": "4",
      "Description": "White Reebok Running Shoes",
      "Title": "Reebok Running Shoes",
      "Images": [
        "https://dummyimage.com/300.png/09f/fff",
        "https://dummyimage.com/300.png/09f/fff",
        "https://dummyimage.com/300.png/09f/fff",
        "https://dummyimage.com/300.png/09f/fff"
      ],
      "IsFeatured": true,
      "Price": 110,
      "ProductAttributes": [
        {
          "Name": "Color",
          "Values": ["White", "Blue", "Black"]
        },
        {
          "Name": "Size",
          "Values": ["EU 38", "EU 40", "EU 42"]
        }
      ],
      "ProductType": "ProductType.variable",
      "ProductVariations": [
        {
          "AttributeValues": {"Color": "White", "Size": "EU 38"},
          "Description": "This is a Product for White Reebok Running Shoes",
          "Id": "4",
          "CategoryId": "4",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 108,
          "SKU": "RBR001-01",
          "SalePrice": 100,
          "Stock": 45
        },
        {
          "AttributeValues": {"Color": "White", "Size": "EU 40"},
          "Description": "This is a Product for White Reebok Running Shoes",
          "Id": "4",
          "CategoryId": "4",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 108,
          "SKU": "RBR001-02",
          "SalePrice": 100,
          "Stock": 45
        },
        {
          "AttributeValues": {"Color": "White", "Size": "EU 42"},
          "Description": "This is a Product for White Reebok Running Shoes",
          "Id": "4",
          "CategoryId": "4",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 108,
          "SKU": "RBR001-03",
          "SalePrice": 100,
          "Stock": 45
        },
        {
          "AttributeValues": {"Color": "Black", "Size": "EU 40"},
          "Description": "This is a Product for Black Reebok Running Shoes",
          "Id": "4",
          "CategoryId": "4",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 108,
          "SKU": "RBR001-04",
          "SalePrice": 100,
          "Stock": 45
        }
      ],
      "SKU": "RBR001",
      "SalePrice": 15,
      "Stock": 30,
      "Thumbnail": "https://dummyimage.com/300.png/09f/fff"
    },
    {
      "Brand": {
        "Id": "4",
        "Name": "Reebok",
        "Image": "https://dummyimage.com/300.png/09f/fff",
        "IsFeatured": true,
        "ProductCount": 75
      },
      "CategoryId": "4",
      "Description": "White Reebok Running Shoes",
      "Title": "Reebok Running Shoes",
      "Images": [
        "https://dummyimage.com/300.png/09f/fff",
        "https://dummyimage.com/300.png/09f/fff",
        "https://dummyimage.com/300.png/09f/fff",
        "https://dummyimage.com/300.png/09f/fff"
      ],
      "IsFeatured": true,
      "Price": 110,
      "ProductAttributes": [
        {
          "Name": "Color",
          "Values": ["White", "Blue", "Black"]
        },
        {
          "Name": "Size",
          "Values": ["EU 38", "EU 40", "EU 42"]
        }
      ],
      "ProductType": "ProductType.variable",
      "ProductVariations": [
        {
          "AttributeValues": {"Color": "White", "Size": "EU 38"},
          "Description": "This is a Product for White Reebok Running Shoes",
          "Id": "4",
          "CategoryId": "4",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 108,
          "SKU": "RBR001-01",
          "SalePrice": 100,
          "Stock": 45
        },
        {
          "AttributeValues": {"Color": "White", "Size": "EU 40"},
          "Description": "This is a Product for White Reebok Running Shoes",
          "Id": "4",
          "CategoryId": "4",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 108,
          "SKU": "RBR001-02",
          "SalePrice": 100,
          "Stock": 45
        },
        {
          "AttributeValues": {"Color": "White", "Size": "EU 42"},
          "Description": "This is a Product for White Reebok Running Shoes",
          "Id": "4",
          "CategoryId": "4",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 108,
          "SKU": "RBR001-03",
          "SalePrice": 100,
          "Stock": 45
        },
        {
          "AttributeValues": {"Color": "Blue", "Size": "EU 38"},
          "Description": "This is a Product for Blue Reebok Running Shoes",
          "Id": "4",
          "CategoryId": "4",
          "Image": "https://dummyimage.com/300.png/09f/fff",
          "Price": 108,
          "SKU": "RBR001-04",
          "SalePrice": 100,
          "Stock": 45
        }
      ],
      "SKU": "RBR001",
      "SalePrice": 15,
      "Stock": 30,
      "Thumbnail": "https://dummyimage.com/300.png/09f/fff"
    }
  ];

  final brands =[
    {
      "Id": "1",
      "Image": "https://firebasestorage.googleapis.com/v0/b/smart-pstu.appspot.com/o/Shop%2FBrands%2Fnike.png?alt=media&token=4bf811c8-fbe1-48fa-936e-fdf52918b1e0",
      "IsFeatured": true,
      "Name": "Nike",
      "ProductCount": 250
    },
    {
      "Id": "2",
      "Image": "https://firebasestorage.googleapis.com/v0/b/smart-pstu.appspot.com/o/Shop%2FBrands%2Fadidas.png?alt=media&token=d6af840d-063a-497e-a290-4468c3fcfac3",
      "IsFeatured": false,
      "Name": "Adidas",
      "ProductCount": 300
    },
    {
      "Id": "3",
      "Image": "https://firebasestorage.googleapis.com/v0/b/smart-pstu.appspot.com/o/Shop%2FBrands%2Fpuma.png?alt=media&token=4fdd81c8-c6ab-4060-89d7-d14b5b8d66a2",
      "IsFeatured": true,
      "Name": "Puma",
      "ProductCount": 200
    },
    {
      "Id": "4",
      "Image": "https://firebasestorage.googleapis.com/v0/b/smart-pstu.appspot.com/o/Shop%2FBrands%2Freebok.png?alt=media&token=44f0dd49-dd2d-4423-af0f-31c6f43a15bb",
      "IsFeatured": false,
      "Name": "Reebok",
      "ProductCount": 180
    },
    {
      "Id": "5",
      "Image": "https://firebasestorage.googleapis.com/v0/b/smart-pstu.appspot.com/o/Shop%2FBrands%2FUnder%20Armour.png?alt=media&token=07427846-fb4f-4d16-9c2d-a053b832000c",
      "IsFeatured": true,
      "Name": "Under Armour",
      "ProductCount": 220
    },
    {
      "Id": "6",
      "Image": "https://firebasestorage.googleapis.com/v0/b/smart-pstu.appspot.com/o/Shop%2FBrands%2FNew%20Balance.png?alt=media&token=d3d4855d-3882-4599-9fcc-0e3346482df7",
      "IsFeatured": false,
      "Name": "New Balance",
      "ProductCount": 210
    },
    {
      "Id": "7",
      "Image": "https://firebasestorage.googleapis.com/v0/b/smart-pstu.appspot.com/o/Shop%2FBrands%2FConverse%20Logo.png?alt=media&token=a5fffd9e-18b7-4a8b-a7c6-3e365851a13d",
      "IsFeatured": true,
      "Name": "Converse",
      "ProductCount": 190
    },
    {
      "Id": "8",
      "Image": "https://firebasestorage.googleapis.com/v0/b/smart-pstu.appspot.com/o/Shop%2FBrands%2FVans%20Logo.jpg?alt=media&token=07ca4d3d-fc52-4857-803b-299896d31c6e",
      "IsFeatured": false,
      "Name": "Vans",
      "ProductCount": 260
    },
    {
      "Id": "9",
      "Image": "https://firebasestorage.googleapis.com/v0/b/smart-pstu.appspot.com/o/Shop%2FBrands%2FAsics.png?alt=media&token=b6c7837a-67f1-41b3-b685-cf01cc427109",
      "IsFeatured": true,
      "Name": "Asics",
      "ProductCount": 240
    },
    {
      "Id": "10",
      "Image": "https://firebasestorage.googleapis.com/v0/b/smart-pstu.appspot.com/o/Shop%2FBrands%2FSkechers.png?alt=media&token=b5b4631c-df9e-463b-8e8b-25ae85a29bb1",
      "IsFeatured": false,
      "Name": "Skechers",
      "ProductCount": 230
    },
    {
      "Id": "11",
      "Image": "https://firebasestorage.googleapis.com/v0/b/smart-pstu.appspot.com/o/Shop%2FBrands%2Ffila.png?alt=media&token=015803c9-40b8-450a-8e7b-a074b0535047",
      "IsFeatured": true,
      "Name": "Fila",
      "ProductCount": 205
    }
  ];


  //Upload Product Data
   Future<void> uploadProductData() async {
    final database = FirebaseFirestore.instance;
    for (var product in productsData) {
      final newDocRef = database.collection('Products').doc();
      await newDocRef.set(product);
    }
  }

  //Upload Brand Dara
  Future<void> uploadBrandData() async {
    final database = FirebaseFirestore.instance;
    for (var brand in brands) {
      final newDocRef = database.collection('Brands').doc();
      await newDocRef.set(brand);
    }
  }
}
