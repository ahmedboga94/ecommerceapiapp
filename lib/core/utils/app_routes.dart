import 'package:go_router/go_router.dart';
import '../../features/presentation/views/auth/forget_password/forget_password_view.dart';
import '../../features/presentation/views/auth/login/login_view.dart';
import '../../features/presentation/views/auth/reset_password/reset_password_view.dart';
import '../../features/presentation/views/auth/reset_password_verfiy/reset_password_verfiy.dart';
import '../../features/presentation/views/auth/signup/sign_up_view.dart';
import '../../features/presentation/views/auth/verfiy_code/verfiy_code_view.dart';
import '../../features/presentation/views/main_view/main_view.dart';
import '../../features/presentation/views/onboarding/on_bording_view.dart';
import '../../features/presentation/views/quick_settings/quick_settings_view.dart';

class AppRoutes {
  // static const String splashView = "/";
  static const String quickSettingsView = "/";
  static const String onBordingView = "/onBordingView";
  static const String loginView = "/loginView";
  static const String signUpView = "/signUpView";
  static const String verfiyCodeView = "/verfiyCodeView";
  static const String forgetPasswordView = "/forgetPasswordView";
  static const String resetPasswordVerfiyView = "/resetPasswordVerfiyView";
  static const String resetPasswordSccuessView = "/resetPasswordSccuessView";

  static const String mainView = "/mainView";
  static const String noteDetailsView = "/notesDetailsView";
  static const String noteEditView = "/noteEditView";
  static const String settingsView = "/settingsView";

  // static final setFinalPage = di<SharedPreferences>().getBool("finalPage");

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: quickSettingsView,
        builder: (context, state) =>
            // setFinalPage != null
            //     ? const LoginView():
            const QuickSettingsView(),
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

      // GoRoute(
      //   path: noteDetailsView,
      //   builder: (context, state) {
      //     final note = state.extra as NoteEntity;
      //     return NoteDetailsView(noteEntity: note);
      //   },
      // ),
    ],
  );
}
