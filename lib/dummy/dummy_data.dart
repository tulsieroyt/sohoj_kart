import 'package:sohoj_kart/utils/constants/image_strings.dart';

import '../features/shop/models/category_model.dart';

class DummyData {
  //This is for banner list
  // static final List<BannerList> banners =[
  //
  // ]

  //This is for user

  static final List<CategoryModel> categories = [
    //Categories
    CategoryModel(
      id: '1',
      name: 'Sports',
      image: SKImages.sportsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      name: 'Furniture',
      image: SKImages.furnitureIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      name: 'Electronics',
      image: SKImages.electronicsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      name: 'Clothes',
      image: SKImages.clothsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      name: 'Shoes',
      image: SKImages.shoesIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      name: 'Cosmetics',
      image: SKImages.cosmeticsIcon,
      isFeatured: true,
    ),

    //Subcategories
    CategoryModel(
        id: '7',
        name: 'Sports Shoes',
        image: SKImages.sportShoesIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '8',
        name: 'Track Suits',
        image: SKImages.trackSuitIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '9',
        name: 'Track Suits',
        image: SKImages.trackSuitIcon,
        isFeatured: false,
        parentId: '1'),

    //Furniture
    CategoryModel(
        id: '10',
        name: 'Bedroom Furniture',
        image: SKImages.bedroomIcon,
        isFeatured: false,
        parentId: '2'),
    CategoryModel(
        id: '11',
        name: 'Kitchen Furniture',
        image: SKImages.kitchenIcon,
        isFeatured: false,
        parentId: '2'),
    CategoryModel(
        id: '12',
        name: 'Office Furniture',
        image: SKImages.officeIcon,
        isFeatured: false,
        parentId: '2'),

    //Electronics
    CategoryModel(
        id: '13',
        name: 'Laptop',
        image: SKImages.laptopIcon,
        isFeatured: false,
        parentId: '3'),
    CategoryModel(
        id: '14',
        name: 'Mobile',
        image: SKImages.mobileIcon,
        isFeatured: false,
        parentId: '3'),
  ];
}
