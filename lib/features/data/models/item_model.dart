import '../../domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  ItemModel({
    super.itemId,
    super.itemName,
    super.itemNameAr,
    super.itemDescription,
    super.itemDescriptionAr,
    super.itemImage,
    super.itemCount,
    super.itemActive,
    super.itemPrice,
    super.itemDiscount,
    super.itemCreated,
    super.itemCategory,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      itemId: json["item_id"] as String,
      itemName: json["item_name"] as String,
      itemNameAr: json["item_name_ar"] as String,
      itemDescription: json["item_description"] as String,
      itemDescriptionAr: json["item_description_ar"] as String,
      itemImage: json["item_image"] as String,
      itemCount: json["item_count"] as String,
      itemActive: json["item_active"] as String,
      itemPrice: json["item_price"] as String,
      itemDiscount: json["item_discount"] as String,
      itemCreated: json["item_created"] as String,
      itemCategory: json["item_category"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "item_id": itemId,
      "item_name": itemName,
      "item_name_ar": itemNameAr,
      "item_description": itemDescription,
      "item_description_ar": itemDescriptionAr,
      "item_image": itemImage,
      "item_count": itemCount,
      "item_active": itemActive,
      "item_price": itemPrice,
      "item_discount": itemDiscount,
      "item_created": itemCreated,
      "item_category": itemCategory,
    };
  }
}
