import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mechar/models/category_contructor.dart';
import 'package:mechar/models/furniture_assets.dart';

List<Furniture> furnitureAssets = [
  Furniture(
      title: 'Sofa 1',
      price: 4999999,
      arUrl:
          'https://drive.google.com/uc?export=download&id=1AMB175zaNpOlZPqX0RbMJGDSotsqZ9LO',
      imgUrl: 'Furniture Assets/Sofa/Sofa 1/Screenshot (18).png',
      category: Category.sofa),
  Furniture(
      title: 'Sofa 2',
      price: 7999999,
      arUrl:
          'https://drive.google.com/uc?export=download&id=1IBM1gybvVwH2rsjhaPIQjqG7zd9wJO6k',
      imgUrl: 'Furniture Assets/Sofa/Sofa 2/Screenshot (19).png',
      category: Category.sofa),
  Furniture(
      title: 'Sofa 3',
      price: 5999999,
      arUrl:
          'https://drive.google.com/uc?export=download&id=1I5NKHr5y8o7wMvaSjKGUR_o3HW8TF39q',
      imgUrl: 'Furniture Assets/Sofa/Sofa 3/Screenshot (16).png',
      category: Category.sofa),
  Furniture(
      title: 'Folding Table 1',
      price: 1999999,
      imgUrl:
          'Furniture Assets/Table/Folding Table/Screenshot 2023-09-11 170632.png',
      arUrl:
          'https://drive.google.com/uc?export=download&id=1PBS31nxoz1wvXF_x1tMlWOZ-ftvh7122',
      category: Category.table),
  Furniture(
      title: 'Wooden Table 1',
      price: 1599999,
      imgUrl:
          'Furniture Assets/Table/Wooden Table/Screenshot 2023-09-11 170816.png',
      arUrl:
          'https://drive.google.com/uc?export=download&id=1otoL2Lq5oxBxpHQpN9xlor5HlklqevPD',
      category: Category.table),
  Furniture(
      title: 'Office Chair 1',
      price: 799999,
      imgUrl:
          'Furniture Assets/Chair/Office Chair 1/Screenshot 2023-09-11 171114 (1).png',
      arUrl:
          'https://drive.google.com/uc?export=download&id=1eJhSm0DRjJ2hKZ0MUJgUzlkJ303QNBqG',
      category: Category.chair),
  Furniture(
      title: 'Wooden Chair 1',
      price: 799999,
      imgUrl:
          'Furniture Assets/Chair/Wooden Chair 1/Screenshot 2023-09-11 171450.png',
      arUrl:
          'https://drive.google.com/uc?export=download&id=1ePtKlObZ8oMG7_-X5nhzOAW8mfO7mIod',
      category: Category.chair),
  Furniture(
      title: 'Coffee maker',
      price: 599999,
      imgUrl:
          'Furniture Assets/Kitchen/Coffee maker 1/Screenshot 2023-09-11 171932.png',
      arUrl:
          'https://drive.google.com/uc?export=download&id=1lWfTt42SdD6ahSQLmEwa3kKdgP29VKzV',
      category: Category.kitchen),
  Furniture(
      title: 'Bed 1',
      price: 7999999,
      imgUrl: 'Furniture Assets/Bed/Bed 1/Screenshot 2023-09-11 172543.png',
      arUrl:
          'https://drive.google.com/uc?export=download&id=1pKuArMEIa7Tkb4BXTq1fZ0bodGJIf300',
      category: Category.bed),
];

List<CategTypes> categoryTypeAssets = [
  CategTypes(
    title: 'Sofa',
    icons: const FaIcon(FontAwesomeIcons.couch, color: Colors.white),
  ),
  CategTypes(
    title: 'Table',
    icons: const FaIcon(FontAwesomeIcons.table, color: Colors.white),
  ),
  CategTypes(
    title: 'Chair',
    icons: const FaIcon(FontAwesomeIcons.chair, color: Colors.white),
  ),
  CategTypes(
    title: 'Kitchen',
    icons: const FaIcon(FontAwesomeIcons.kitchenSet, color: Colors.white),
  ),
  CategTypes(
    title: 'Bed',
    icons: const FaIcon(FontAwesomeIcons.bed, color: Colors.white),
  ),
  CategTypes(
    title: 'Coming Soon',
    icons: const FaIcon(FontAwesomeIcons.gear, color: Colors.white),
  )
];
