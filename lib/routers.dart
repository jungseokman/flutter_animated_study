import 'package:flutter/material.dart';
import 'package:flutter_animation_study/pages/animated_container_page.dart';
import 'package:flutter_animation_study/pages/animated_default_textstyle_page.dart';
import 'package:flutter_animation_study/pages/main_page.dart';
import 'package:go_router/go_router.dart';

final routers = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: "main",
      pageBuilder: (context, state) => const NoTransitionPage(
        child: MainPage(),
      ),
    ),
    GoRoute(
      path: "/animatedTextstyle",
      name: "animatedTextstyle",
      pageBuilder: (context, state) => const NoTransitionPage(
        child: AnimatedDefaultTextstylePage(),
      ),
    ),
    GoRoute(
      path: "/animatedContainer",
      name: "animatedContainer",
      // pageBuilder: (context, state) => const NoTransitionPage(
      //   child: AnimatedContainerPage(),
      // ),

      pageBuilder: (context, state) => CustomTransitionPage(
        child: const AnimatedContainerPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),
  ],
);
