import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DummyDataUploadScreen extends StatelessWidget {
  const DummyDataUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Data Upload Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
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
                    "Description":
                        "This is a Product for Green Nike Sports Shoes",
                    "Id": "1",
                    "Image": "https://dummyimage.com/300.png/09f/fff",
                    "Price": 134,
                    "SKU": "",
                    "SalePrice": 122.6,
                    "Stock": 34
                  },
                  {
                    "AttributeValues": {"Color": "Black", "Size": "EU 36"},
                    "Description":
                        "This is a Product for Green Nike Sports Shoes",
                    "Id": "1",
                    "Image": "https://dummyimage.com/300.png/09f/fff",
                    "Price": 134,
                    "SKU": "",
                    "SalePrice": 122.6,
                    "Stock": 34
                  },
                  {
                    "AttributeValues": {"Color": "Red", "Size": "EU 32"},
                    "Description":
                        "This is a Product for Green Nike Sports Shoes",
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
                    "Description":
                        "This is a Product for White Reebok Running Shoes",
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
                    "Description":
                        "This is a Product for White Reebok Running Shoes",
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
                    "Description":
                        "This is a Product for White Reebok Running Shoes",
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
                    "Description":
                        "This is a Product for White Reebok Running Shoes",
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
                    "Description":
                        "This is a Product for White Reebok Running Shoes",
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
                    "Description":
                        "This is a Product for White Reebok Running Shoes",
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
                    "Description":
                        "This is a Product for Black Reebok Running Shoes",
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
                    "Description":
                        "This is a Product for White Reebok Running Shoes",
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
                    "Description":
                        "This is a Product for White Reebok Running Shoes",
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
                    "Description":
                        "This is a Product for White Reebok Running Shoes",
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
                    "Description":
                        "This is a Product for Blue Reebok Running Shoes",
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

            final productsDatas = [
              {
                "Brand": {
                  "Id": "2",
                  "Name": "Adidas",
                  "Image": "https://dummyimage.com/300.png/09f/fff",
                  "IsFeatured": true,
                  "ProductCount": 90
                },
                "CategoryId": "2",
                "Description": "Blue Adidas Running Shoes",
                "Title": "Adidas Running Shoes",
                "Images": [
                  "https://dummyimage.com/300.png/09f/fff",
                  "https://dummyimage.com/300.png/09f/fff",
                  "https://dummyimage.com/300.png/09f/fff",
                  "https://dummyimage.com/300.png/09f/fff"
                ],
                "IsFeatured": true,
                "Price": 120,
                "ProductAttributes": [
                  {
                    "Name": "Color",
                    "Values": ["Blue", "Grey", "Black"]
                  },
                  {
                    "Name": "Size",
                    "Values": ["EU 40", "EU 42", "EU 44"]
                  }
                ],
                "ProductType": "ProductType.variable",
                "ProductVariations": [
                  {
                    "AttributeValues": {"Color": "Blue", "Size": "EU 40"},
                    "Description": "This is a Product for Blue Adidas Running Shoes",
                    "Id": "2",
                    "Image": "https://dummyimage.com/300.png/09f/fff",
                    "Price": 118,
                    "SKU": "ADS001-01",
                    "SalePrice": 110,
                    "Stock": 40
                  },
                  {
                    "AttributeValues": {"Color": "Grey", "Size": "EU 42"},
                    "Description": "This is a Product for Grey Adidas Running Shoes",
                    "Id": "2",
                    "Image": "https://dummyimage.com/300.png/09f/fff",
                    "Price": 118,
                    "SKU": "ADS001-02",
                    "SalePrice": 110,
                    "Stock": 40
                  }
                ],
                "SKU": "ADS001",
                "SalePrice": 35,
                "Stock": 20,
                "Thumbnail": "https://dummyimage.com/300.png/09f/fff"
              },
              {
                "Brand": {
                  "Id": "5",
                  "Name": "Under Armour",
                  "Image": "https://dummyimage.com/300.png/09f/fff",
                  "IsFeatured": false,
                  "ProductCount": 65
                },
                "CategoryId": "5",
                "Description": "Under Armour Running Shoes",
                "Title": "Under Armour Running Shoes",
                "Images": [
                  "https://dummyimage.com/300.png/09f/fff",
                  "https://dummyimage.com/300.png/09f/fff",
                  "https://dummyimage.com/300.png/09f/fff",
                  "https://dummyimage.com/300.png/09f/fff"
                ],
                "IsFeatured": false,
                "Price": 95,
                "ProductAttributes": [
                  {
                    "Name": "Color",
                    "Values": ["Black", "Grey", "White"]
                  },
                  {
                    "Name": "Size",
                    "Values": ["EU 37", "EU 39", "EU 41"]
                  }
                ],
                "ProductType": "ProductType.variable",
                "ProductVariations": [
                  {
                    "AttributeValues": {"Color": "Black", "Size": "EU 37"},
                    "Description": "This is a Product for Black Under Armour Running Shoes",
                    "Id": "5",
                    "Image": "https://dummyimage.com/300.png/09f/fff",
                    "Price": 93,
                    "SKU": "UARM001-01",
                    "SalePrice": 85,
                    "Stock": 35
                  },
                  {
                    "AttributeValues": {"Color": "White", "Size": "EU 41"},
                    "Description": "This is a Product for White Under Armour Running Shoes",
                    "Id": "5",
                    "Image": "https://dummyimage.com/300.png/09f/fff",
                    "Price": 93,
                    "SKU": "UARM001-02",
                    "SalePrice": 85,
                    "Stock": 35
                  }
                ],
                "SKU": "UARM001",
                "SalePrice": 20,
                "Stock": 22,
                "Thumbnail": "https://dummyimage.com/300.png/09f/fff"
              },
              {
                "Brand": {
                  "Id": "6",
                  "Name": "Asics",
                  "Image": "https://dummyimage.com/300.png/09f/fff",
                  "IsFeatured": true,
                  "ProductCount": 55
                },
                "CategoryId": "6",
                "Description": "Grey Asics Trail Shoes",
                "Title": "Asics Trail Shoes",
                "Images": [
                  "https://dummyimage.com/300.png/09f/fff",
                  "https://dummyimage.com/300.png/09f/fff",
                  "https://dummyimage.com/300.png/09f/fff",
                  "https://dummyimage.com/300.png/09f/fff"
                ],
                "IsFeatured": true,
                "Price": 130,
                "ProductAttributes": [
                  {
                    "Name": "Color",
                    "Values": ["Grey", "Blue", "Black"]
                  },
                  {
                    "Name": "Size",
                    "Values": ["EU 42", "EU 44", "EU 46"]
                  }
                ],
                "ProductType": "ProductType.variable",
                "ProductVariations": [
                  {
                    "AttributeValues": {"Color": "Grey", "Size": "EU 42"},
                    "Description": "This is a Product for Grey Asics Trail Shoes",
                    "Id": "6",
                    "Image": "https://dummyimage.com/300.png/09f/fff",
                    "Price": 128,
                    "SKU": "ASCS001-01",
                    "SalePrice": 120,
                    "Stock": 25
                  },
                  {
                    "AttributeValues": {"Color": "Black", "Size": "EU 46"},
                    "Description": "This is a Product for Black Asics Trail Shoes",
                    "Id": "6",
                    "Image": "https://dummyimage.com/300.png/09f/fff",
                    "Price": 128,
                    "SKU": "ASCS001-02",
                    "SalePrice": 120,
                    "Stock": 25
                  }
                ],
                "SKU": "ASCS001",
                "SalePrice": 32,
                "Stock": 18,
                "Thumbnail": "https://dummyimage.com/300.png/09f/fff"
              }
            ];


            final database = FirebaseFirestore.instance;
            for (var product in productsDatas) {
              final newDocRef = database.collection('Products').doc();
              await newDocRef.set(product);
            }
          },
          child: const Text('Upload Data'),
        ),
      ),
    );
  }
}
