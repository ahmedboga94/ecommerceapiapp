import '../../../core/functions/translate_database.dart';

class ItemEntity {
  String? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDescription;
  String? itemDescriptionAr;
  String? itemImage;
  String? itemCount;
  String? itemActive;
  String? itemPrice;
  String? itemDiscount;
  String? itemCreated;
  String? itemCategory;

  ItemEntity({
    this.itemId,
    this.itemName,
    this.itemNameAr,
    this.itemDescription,
    this.itemDescriptionAr,
    this.itemImage,
    this.itemCount,
    this.itemActive,
    this.itemPrice,
    this.itemDiscount,
    this.itemCreated,
    this.itemCategory,
  });

  String translatedItemName() {
    return translateDatabase(itemName!, itemNameAr!);
  }

  String translatedItemDescription() {
    return translateDatabase(itemDescription!, itemDescriptionAr!);
  }
}
