import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../entities/favorite_entity.dart';
import '../../entities/item_entity.dart';
import '../../repositories/profile_repo.dart';

class GetUserFavoriteItemsUseCase {
  final ProfileRepo _profileRepo;

  GetUserFavoriteItemsUseCase(this._profileRepo);

  Future<Either<Failure, List<ItemEntity>>> call(
      FavoriteEntity favoriteEntity) {
    return _profileRepo.getUserFavoriteItems(favoriteEntity);
  }
}
