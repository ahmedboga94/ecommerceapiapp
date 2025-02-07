import '../../domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    super.cartId,
    super.userId,
    super.itemId,
    super.itemQty,
    super.cartCreated,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      cartId: json["cart_id"] as String?,
      userId: json["cart_userid"] as String?,
      itemId: json["cart_itemid"] as String?,
      itemQty: json["cart_itemqty"] as String?,
      cartCreated: json["cart_created"] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "cart_userid": userId,
      "cart_itemid": itemId,
      "cart_itemqty": itemQty,
    };
  }
}
