import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../entities/favorite_entity.dart';
import '../../repositories/profile_repo.dart';

class RemoveFavoriteItemsUseCase {
  final ProfileRepo _profileRepo;

  RemoveFavoriteItemsUseCase(this._profileRepo);

  Future<Either<Failure, Map<String, dynamic>>> call(
      FavoriteEntity favoriteEntity) {
    return _profileRepo.removeFavoriteItems(favoriteEntity);
  }
}
