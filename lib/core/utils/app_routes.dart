import 'package:go_router/go_router.dart';

import '../../features/presentation/views/auth/login/login_view.dart';
import '../../features/presentation/views/onboarding/on_bording_view.dart';

class AppRoutes {
  // static const String splashView = "/";
  static const String onBordingView = "/";
  static const String loginView = "/loginView";

  static const String mainView = "/mainView";
  static const String noteDetailsView = "/notesDetailsView";
  static const String noteEditView = "/noteEditView";
  static const String settingsView = "/settingsView";

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: onBordingView,
        builder: (context, state) => const OnBordingView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => const LoginView(),
      ),

      // GoRoute(
      //   path: mainView,
      //   builder: (context, state) => const MainView(),
      // ),
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
