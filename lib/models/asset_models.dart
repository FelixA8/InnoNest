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
      imgUrl:
          'https://drive.google.com/uc?export=download&id=1uQXpcp7n6JLqMgUi8AulnXRf5yUOAq__',
      category: Category.sofa),
  Furniture(
      title: 'Sofa 2',
      price: 7999999,
      arUrl:
          'https://drive.google.com/uc?export=download&id=1IBM1gybvVwH2rsjhaPIQjqG7zd9wJO6k',
      imgUrl:
          'https://drive.google.com/uc?export=download&id=1a8R2oqA4mDpT1JDKXjocna_GcxcVdCc3',
      category: Category.sofa),
  Furniture(
      title: 'Sofa 3',
      price: 5999999,
      arUrl:
          'https://drive.google.com/uc?export=download&id=1I5NKHr5y8o7wMvaSjKGUR_o3HW8TF39q',
      imgUrl:
          'https://drive.google.com/uc?export=download&id=1yUHCn8bC8YkweTXMeoX6jSyZo8ev9XSX',
      category: Category.sofa),
  Furniture(
      title: 'Folding Table 1',
      price: 1999999,
      imgUrl:
          'https://drive.google.com/uc?export=download&id=1dy_r2gFIXPVawmTYYXA7ijo_XQyA1GYQ',
      arUrl:
          'https://drive.google.com/uc?export=download&id=1PBS31nxoz1wvXF_x1tMlWOZ-ftvh7122',
      category: Category.table),
  Furniture(
      title: 'Wooden Table 1',
      price: 1599999,
      imgUrl:
          'https://drive.google.com/uc?export=download&id=1Ges9eKkwY-EuWQNdgBB5l9CS8bnanVFT',
      arUrl:
          'https://drive.google.com/uc?export=download&id=1otoL2Lq5oxBxpHQpN9xlor5HlklqevPD',
      category: Category.table),
  Furniture(
      title: 'Office Chair 1',
      price: 799999,
      imgUrl:
          'https://drive.google.com/uc?export=download&id=14uWZ8lP6mqVh4GiqB8Z4Kt0PFxu6s0iF',
      arUrl:
          'https://drive.google.com/uc?export=download&id=1eJhSm0DRjJ2hKZ0MUJgUzlkJ303QNBqG',
      category: Category.chair),
  Furniture(
      title: 'Wooden Chair 1',
      price: 799999,
      imgUrl:
          'https://drive.google.com/uc?export=download&id=15Ru8TThp5Ue71_oFBTroYsG1lkvUUzaG',
      arUrl:
          'https://drive.google.com/uc?export=download&id=1ePtKlObZ8oMG7_-X5nhzOAW8mfO7mIod',
      category: Category.chair),
  Furniture(
      title: 'Coffee maker',
      price: 599999,
      imgUrl:
          'https://drive.google.com/uc?export=download&id=1Nv6UeyGqlnXK9K8U3Ds81Cr8byzqMsjG',
      arUrl:
          'https://drive.google.com/uc?export=download&id=1lWfTt42SdD6ahSQLmEwa3kKdgP29VKzV',
      category: Category.kitchen),
  Furniture(
      title: 'Bed 1',
      price: 7999999,
      imgUrl:
          'https://drive.google.com/uc?export=download&id=1XNOVj73YECeHQGocFrTO-Kgb2TR42qS3',
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
    icons: const FaIcon(FontAwesomeIcons.couch, color: Colors.white),
  ),
  CategTypes(
    title: 'Chair',
    icons: const FaIcon(FontAwesomeIcons.couch, color: Colors.white),
  ),
  CategTypes(
    title: 'Kitchen',
    icons: const FaIcon(FontAwesomeIcons.couch, color: Colors.white),
  ),
  CategTypes(
    title: 'Bed',
    icons: const FaIcon(FontAwesomeIcons.couch, color: Colors.white),
  ),
  CategTypes(
    title: 'Coming Soon',
    icons: const FaIcon(FontAwesomeIcons.gear, color: Colors.white),
  )
];
