import 'dart:io';

class AddProductEntity {
  final String name;
  final String description;
  final String code;
  final num price;
  final bool isFeaturedItem;
  String? imagePath;
  final File imageFile;
  final int expirationMonth;
  final bool isOrganic;
  final int unitAmount;
  final int numOfCalaories;
  final num averageRating;
  final num ratingCount;

  AddProductEntity(
    this.imageFile, {
    this.averageRating = 0,
    this.ratingCount = 0,
    required this.expirationMonth,
    required this.isOrganic,
    required this.unitAmount,
    required this.numOfCalaories,
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    required this.isFeaturedItem,
    this.imagePath,
  });
}
