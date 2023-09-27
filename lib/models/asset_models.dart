import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mechar/models/cart_models.dart';
import 'package:mechar/models/category_contructor.dart';
import 'package:mechar/models/furniture_assets.dart';

List<Furniture> furnitureAssets = [
  Furniture(
      title: 'Sofa 1',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      price: 4999999,
      location: 'Jakarta Barat',
      arUrl: 'Furniture Assets/Sofa/Sofa 1/sofa (2).glb',
      imgUrl: 'Furniture Assets/Sofa/Sofa 1/Sofa_1.jpg',
      category: Category.sofa,
      id: '1'),
  Furniture(
      title: 'Sofa 2',
      description: 'this is a description',
      price: 7999999,
      location: 'Jakarta Barat',
      arUrl: 'Furniture Assets/Sofa/Sofa 1/sofa_web (2).glb',
      imgUrl: 'Furniture Assets/Sofa/Sofa 2/Sofa_2.jpg',
      category: Category.sofa,
      id: '2'),
  Furniture(
      title: 'Sofa 3',
      description: 'this is a description',
      price: 5999999,
      location: 'Jakarta Barat',
      arUrl: 'Furniture Assets/Sofa/Sofa 3/modern__sofa.glb',
      imgUrl: 'Furniture Assets/Sofa/Sofa 3/Sofa_3.jpg',
      category: Category.sofa,
      id: '3'),
  Furniture(
      title: 'Folding Table 1',
      description: 'this is a description',
      price: 1999999,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Table/Folding Table/Folding_Table.jpg',
      arUrl: 'Furniture Assets/Table/Folding Table/folding_table.glb',
      category: Category.table,
      id: '4'),
  Furniture(
      title: 'Wooden Table 1',
      description: 'this is a description',
      price: 1599999,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Table/Wooden Table/Wooden_Table.jpg',
      arUrl: 'Furniture Assets/Table/Wooden Table/wooden_table.glb',
      category: Category.table,
      id: '5'),
  Furniture(
      title: 'Office Chair 1',
      description: 'this is a description',
      price: 199999,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Chair/Office Chair 1/Office_Chair.jpg',
      arUrl: 'Furniture Assets/Chair/Office Chair 1/office_chair.glb',
      category: Category.chair,
      id: '6'),
  Furniture(
      title: 'Wooden Chair 1',
      description: 'this is a description',
      price: 399999,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Chair/Wooden Chair 1/Wooden_Chair.jpg',
      arUrl: 'Furniture Assets/Chair/Wooden Chair 1/rustic_chair (1).glb',
      category: Category.chair,
      id: '7'),
  Furniture(
      title: 'Coffee maker',
      description: 'this is a description',
      price: 599999,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Kitchen/Coffee maker 1/Coffee_Maker.jpg',
      arUrl: 'Furniture Assets/Kitchen/Coffee maker 1/coffee_maker.glb',
      category: Category.kitchen,
      id: '8'),
  Furniture(
      title: 'Bed 1',
      description: 'this is a description',
      price: 7999999,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Bed/Bed 1/Bed_1.jpg',
      arUrl: 'Furniture Assets/Bed/Bed 1/bed.glb',
      category: Category.bed,
      id: '9'),
];

List<CategTypes> categoryTypeAssets = [
  CategTypes(
    title: 'Sofa',
    icons: const FaIcon(FontAwesomeIcons.couch, color: Colors.white),
    category: Category.sofa,
  ),
  CategTypes(
    title: 'Table',
    icons: const FaIcon(FontAwesomeIcons.table, color: Colors.white),
    category: Category.table,
  ),
  CategTypes(
    title: 'Chair',
    icons: const FaIcon(FontAwesomeIcons.chair, color: Colors.white),
    category: Category.chair,
  ),
  CategTypes(
    title: 'Kitchen',
    icons: const FaIcon(FontAwesomeIcons.kitchenSet, color: Colors.white),
    category: Category.kitchen,
  ),
  CategTypes(
    title: 'Bed',
    icons: const FaIcon(FontAwesomeIcons.bed, color: Colors.white),
    category: Category.bed,
  ),
  CategTypes(
    title: 'Coming Soon',
    icons: const FaIcon(FontAwesomeIcons.gear, color: Colors.white),
    category: Category.none,
  )
];

List<Cart> cardAssets = [
  Cart(furniture: furnitureAssets[0], amount: 2, onChecked: false)
];

// sofa1: https://drive.google.com/uc?export=download&id=1AMB175zaNpOlZPqX0RbMJGDSotsqZ9LO
// sofa2: https://drive.google.com/uc?export=download&id=1IBM1gybvVwH2rsjhaPIQjqG7zd9wJO6k
// sofa3: https://drive.google.com/uc?export=download&id=1I5NKHr5y8o7wMvaSjKGUR_o3HW8TF39q
// Folding Table 1: https://drive.google.com/uc?export=download&id=1PBS31nxoz1wvXF_x1tMlWOZ-ftvh7122
// Wooden Table 1: https://drive.google.com/uc?export=download&id=1ePtKlObZ8oMG7_-X5nhzOAW8mfO7mIod
// Office Chair 1: https://drive.google.com/uc?export=download&id=1eJhSm0DRjJ2hKZ0MUJgUzlkJ303QNBqG
// Wooden Chair 1: https://drive.google.com/uc?export=download&id=1ePtKlObZ8oMG7_-X5nhzOAW8mfO7mIod
// Coffee maker: https://drive.google.com/uc?export=download&id=1lWfTt42SdD6ahSQLmEwa3kKdgP29VKzV
// Bed 1: https://drive.google.com/uc?export=download&id=1pKuArMEIa7Tkb4BXTq1fZ0bodGJIf300
