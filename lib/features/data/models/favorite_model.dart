import '../../domain/entities/favorite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  FavoriteModel({
    super.favouriteId,
    super.userId,
    super.itemId,
    super.favouriteCreated,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      favouriteId: json["favorite_id"] as String?,
      userId: json["favorite_userid"] as String?,
      itemId: json["favorite_itemid"] as String?,
      favouriteCreated: json["favorite_created"] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "favorite_userid": userId,
      "favorite_itemid": itemId,
    };
  }
}
