import 'package:flutter/material.dart';
import 'package:flutter_animation_study/pages/animated_align_page.dart';
import 'package:flutter_animation_study/pages/animated_container_page.dart';
import 'package:flutter_animation_study/pages/animated_cross_fade_page.dart';
import 'package:flutter_animation_study/pages/animated_default_textstyle_page.dart';
import 'package:flutter_animation_study/pages/animated_opacity_page.dart';
import 'package:flutter_animation_study/pages/animated_positioned_page.dart';
import 'package:flutter_animation_study/pages/animated_switcher_page.dart';
import 'package:flutter_animation_study/pages/hero_page.dart';
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
      //! 아무런 효과가 없는 일반적은 페이지 전환.
      pageBuilder: (context, state) => const NoTransitionPage(
        child: AnimatedDefaultTextstylePage(),
      ),
    ),
    GoRoute(
      path: "/animatedContainer",
      name: "animatedContainer",
      //! 페이지가 천천히 사라지면서 전환되는 효과.
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
    GoRoute(
      path: "/animatedOpacity",
      name: "animatedOpacity",
      //! 페이지가 왼쪽에서 오른쪽으로 이동되면서 전환 (전환 방향 및 속도 조절가능)
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const AnimatedOpacityPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offserAnimation = animation.drive(tween);

          return SlideTransition(
            position: offserAnimation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: "/animatedPositioned",
      name: "animatedPositioned",
      //! 페이지가 가운데로 작아지면서 사라지고 새로운 페이지가 커지면서 나타나며 전환.
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const AnimatedPositionedPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: "/animatedAlign",
      name: "animatedAlign",
      //! 페이지가 돌아가면서 전환
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const AnimatedAlignPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return RotationTransition(
            turns: animation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: "/animatedCrossFade",
      name: "animatedCrossFade",
      //! 페이지가 지정한 위치로 작아지면서 사라지고 새로운 페이지가 커지면서 나타나며 전환.
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const AnimatedCrossFadePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.topLeft,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: "/animatedSwitcher",
      name: "animatedSwitcher",
      //! 반시계방향으로 회전하면서 페이지 전환
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const AnimatedSwitcherPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var turnsTween = Tween(begin: 0.0, end: -1.0);
          var turnsAnimation = animation.drive(turnsTween);

          return RotationTransition(
            turns: turnsAnimation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: "/hero",
      name: "hero",
      builder: (context, state) => const HeroPage(),
    ),
  ],
);
