import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_eyezon_app/core/navigation/custom_bottom_nav_bar.dart';
import 'package:my_eyezon_app/core/routes/app_routes.dart';
import 'package:my_eyezon_app/features/Admin%20Management/presentation/views/add_Admin_criminal_view.dart';
import 'package:my_eyezon_app/features/Criminals%20Management/presentation/views/criminal_status_view.dart';
import 'package:my_eyezon_app/features/Criminals%20Management/presentation/views/wanted_criminals_view.dart';
import 'package:my_eyezon_app/features/Profile%20&%20Settings/presentation/views/settings_view.dart';
import 'package:my_eyezon_app/features/Splash/presentation/views/splash_view.dart';
import 'package:my_eyezon_app/features/home/presentation/views/home_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          final location = state.uri.toString();
          int currentIndex = 0;

          if (location.startsWith(AppRoutes.home)) {
            currentIndex = 0;
          } else if (location.startsWith(AppRoutes.criminalStatus)) {
            currentIndex = 1;
          } else if (location.startsWith(AppRoutes.addAdminCriminal)) {
            currentIndex = 2;
          } else if (location.startsWith(AppRoutes.wantedCriminals)) {
            currentIndex = 3;
          } else if (location.startsWith(AppRoutes.settings)) {
            currentIndex = 4;
          }

          return Scaffold(
            body: child,
            bottomNavigationBar: CustomBottomNavBar(
              currentIndex: currentIndex,
              onTap: (index) {
                switch (index) {
                  case 0:
                    context.go(AppRoutes.home);
                    break;
                  case 1:
                    context.go(AppRoutes.criminalStatus);
                    break;
                  case 2:
                    context.go(AppRoutes.settings);
                    break;
                  case 3:
                    context.go(AppRoutes.wantedCriminals);
                    break;
                  case 4:
                    context.go(AppRoutes.settings);
                    break;
                }
              },
            ),
          );
        },
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => const HomeView(),
          ),
          GoRoute(
            path: AppRoutes.criminalStatus,
            builder: (context, state) => const CriminalStatusView(),
          ),
          GoRoute(
            path: AppRoutes.addAdminCriminal,
            builder: (context, state) => const AddAdminCriminalView(),
          ),
          GoRoute(
            path: AppRoutes.wantedCriminals,
            builder: (context, state) => const WantedCriminalsView(),
          ),
          GoRoute(
            path: AppRoutes.settings,
            builder: (context, state) => const SettingsView(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashView(),
      ),
    ],
  );
}
