import 'package:flutter/material.dart';
import 'package:flutter_animation_study/routers.dart';

void main() {
  runApp(const AnimationStudy());
}

class AnimationStudy extends StatelessWidget {
  const AnimationStudy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routers,
    );
  }
}
