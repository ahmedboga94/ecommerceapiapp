import '../../../core/functions/translate_database.dart';

class CategoryEntity {
  String? categoryId;
  String? categoryName;
  String? categoryNameAr;
  String? categoryImage;
  String? categoryCreated;

  CategoryEntity({
    this.categoryId,
    this.categoryName,
    this.categoryNameAr,
    this.categoryImage,
    this.categoryCreated,
  });

  String translatedCategoryName() {
    return translateDatabase(categoryName!, categoryNameAr!);
  }
}
