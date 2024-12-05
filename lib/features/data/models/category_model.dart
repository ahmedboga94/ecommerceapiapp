import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    super.categoryId,
    super.categoryName,
    super.categoryNameAr,
    super.categoryImage,
    super.categoryCreated,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json["category_id"] as String,
      categoryName: json["category_name"] as String,
      categoryNameAr: json["category_name_ar"] as String,
      categoryImage: json["category_image"] as String,
      categoryCreated: json["category_created"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "category_id": categoryId,
      "category_name": categoryName,
      "category_name_ar": categoryNameAr,
      "category_image": categoryImage,
      "category_created": categoryCreated,
    };
  }
}
