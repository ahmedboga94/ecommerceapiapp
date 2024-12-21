import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/domain/entities/category_entity.dart';
import '../../features/domain/entities/item_entity.dart';
import '../../features/presentation/views/auth/forget_password/forget_password_view.dart';
import '../../features/presentation/views/auth/login/login_view.dart';
import '../../features/presentation/views/auth/reset_password/reset_password_view.dart';
import '../../features/presentation/views/auth/reset_password_verfiy/reset_password_verfiy.dart';
import '../../features/presentation/views/auth/signup/sign_up_view.dart';
import '../../features/presentation/views/auth/verfiy_code/verfiy_code_view.dart';
import '../../features/presentation/views/category_items/category_items_view.dart';
import '../../features/presentation/views/edit_profile/edit_profile_view.dart';
import '../../features/presentation/views/items_details/items_details_view.dart';
import '../../features/presentation/views/main_app/main_view.dart';
import '../../features/presentation/views/onboarding/on_bording_view.dart';
import '../../features/presentation/views/quick_settings/quick_settings_view.dart';
import '../constants/app_strings.dart';
import '../di/init_di.dart';

class AppRoutes {
  static const String quickSettingsView = "/";
  static const String onBordingView = "/onBordingView";
  static const String loginView = "/loginView";
  static const String signUpView = "/signUpView";
  static const String verfiyCodeView = "/verfiyCodeView";
  static const String forgetPasswordView = "/forgetPasswordView";
  static const String resetPasswordVerfiyView = "/resetPasswordVerfiyView";
  static const String resetPasswordSccuessView = "/resetPasswordSccuessView";
  static const String mainView = "/mainView";
  static const String editProfile = "/editProfile";
  static const String categoryItems = "/categoryItems";
  static const String itemDetails = "/itemDetails";

  static final setStartUpPage =
      di<SharedPreferences>().getBool(AppStrings.mainPage);

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: quickSettingsView,
        builder: (context, state) => setStartUpPage == true
            ? const MainView()
            : const QuickSettingsView(),
      ),
      GoRoute(
        path: onBordingView,
        builder: (context, state) => const OnBordingView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: signUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: verfiyCodeView,
        builder: (context, state) {
          final email = state.extra as String;
          return VerfiyCodeView(email: email);
        },
      ),
      GoRoute(
        path: forgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: resetPasswordVerfiyView,
        builder: (context, state) {
          final email = state.extra as String;
          return ResetPasswordVerfiyView(email: email);
        },
      ),
      GoRoute(
        path: resetPasswordSccuessView,
        builder: (context, state) {
          final mail = state.extra as String;
          return ResetPasswordView(mail: mail);
        },
      ),
      GoRoute(
        path: mainView,
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: editProfile,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: categoryItems,
        builder: (context, state) {
          final categories = state.extra as CategoryEntity;
          return CategoryItemsView(categoryEntity: categories);
        },
      ),
      GoRoute(
        path: itemDetails,
        builder: (context, state) {
          final items = state.extra as ItemEntity;
          return ItemsDetailsView(itemEntity: items);
        },
      ),
    ],
  );
}
