import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../entities/favorite_entity.dart';
import '../../repositories/profile_repo.dart';

class AddFavoriteItemsUseCase {
  final ProfileRepo profileRepo;

  AddFavoriteItemsUseCase(this.profileRepo);

  Future<Either<Failure, Map<String, dynamic>>> call(
      FavoriteEntity favoriteEntity) {
    return profileRepo.addFavoriteItems(favoriteEntity);
  }
}
