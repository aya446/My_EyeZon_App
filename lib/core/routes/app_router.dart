import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_eyezon_app/core/navigation/custom_bottom_nav_bar.dart';
import 'package:my_eyezon_app/core/routes/app_routes.dart';
import 'package:my_eyezon_app/features/Criminals%20Management/presentation/views/criminal_status_view.dart';
import 'package:my_eyezon_app/features/Criminals%20Management/presentation/views/wanted_criminals_view.dart';
import 'package:my_eyezon_app/features/Profile%20&%20Settings/presentation/views/settings_view.dart';
import 'package:my_eyezon_app/features/home/presentation/views/home_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          final location = state.uri.toString();
          int currentIndex = 0;

          if (location.startsWith('/home')) {
            currentIndex = 0;
          } else if (location.startsWith('/support')) {
            currentIndex = 1;
          } else if (location.startsWith('/profile')) {
            currentIndex = 2;
          }

          return Scaffold(
            body: child,
            bottomNavigationBar: CustomBottomNavBar(
              currentIndex: currentIndex,
              onTap: (index) {
                switch (index) {
                  case 0:
                    context.go('/home');
                    break;
                  case 1:
                    context.go('/support');
                    break;
                  case 2:
                    context.go('/profile');
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
            path: AppRoutes.wantedCriminals,
            builder: (context, state) => const WantedCriminalsView(),
          ),
          GoRoute(
            path: AppRoutes.settings,
            builder: (context, state) => const SettingsView(),
          ),
        ],
      ),
      // GoRoute(
      //   path: AppRoutes.home,
      //   builder: (context, state) => const SupportChatView(),
      // ),
    ],
  );
}
