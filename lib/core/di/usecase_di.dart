import '../../features/domain/usecases/auth/forget_password_use_case.dart';
import '../../features/domain/usecases/auth/login_use_case.dart';
import '../../features/domain/usecases/auth/reset_password_use_case.dart';
import '../../features/domain/usecases/auth/reset_password_verfiy_use_case.dart';
import '../../features/domain/usecases/auth/sign_up_use_case.dart';
import '../../features/domain/usecases/auth/verify_code_use_case.dart';
import '../../features/domain/usecases/cart/get_cart_items_use_case.dart';
import '../../features/domain/usecases/home/get_categories_use_case.dart';
import '../../features/domain/usecases/home/get_category_items_use_case.dart';
import '../../features/domain/usecases/home/get_discount_items_use_case.dart';
import '../../features/domain/usecases/profile/add_favorite_items_use_case.dart';
import '../../features/domain/usecases/profile/clear_user_data_use_case.dart';
import '../../features/domain/usecases/profile/get_user_data_use_case.dart';
import '../../features/domain/usecases/profile/get_user_favorite_items_use_case.dart';
import '../../features/domain/usecases/profile/remove_favorite_items_use_case.dart';
import '../../features/domain/usecases/profile/set_language_use_case.dart';
import '../../features/domain/usecases/profile/set_theme_use_case.dart';
import 'init_di.dart';

useCaseDi() async {
  // Auth
  di.registerLazySingleton(() => SignUpUseCase(di()));
  di.registerLazySingleton(() => VerifyCodeUseCase(di()));
  di.registerLazySingleton(() => LoginUseCase(di()));
  di.registerLazySingleton(() => ForgetPasswordUseCase(di()));
  di.registerLazySingleton(() => ResetPasswordVerfiyUseCase(di()));
  di.registerLazySingleton(() => ResetPasswordUseCase(di()));

  // Home
  di.registerLazySingleton(() => GetCategoriesUseCase(di()));
  di.registerLazySingleton(() => GetDiscountItemsUseCase(di()));
  di.registerLazySingleton(() => GetCategoryItemsUseCase(di()));

  // Cart
  di.registerLazySingleton(() => GetCartItemsUseCase(di()));

  // Profile
  di.registerLazySingleton(() => SetThemeUseCase(di()));
  di.registerLazySingleton(() => SetLanguageUseCase(di()));
  di.registerLazySingleton(() => GetUserDataUseCase(di()));
  di.registerLazySingleton(() => ClearUserDataUseCase(di()));
  di.registerLazySingleton(() => GetUserFavoriteItemsUseCase(di()));
  di.registerLazySingleton(() => AddFavoriteItemsUseCase(di()));
  di.registerLazySingleton(() => RemoveFavoriteItemsUseCase(di()));
}
