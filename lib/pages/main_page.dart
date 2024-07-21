import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("애니메이션 효과 학습"),
        backgroundColor: Colors.deepPurple.shade100,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed("animatedTextstyle");
                  },
                  child: const Text("AnimatedDefaultTextStyle"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed("animatedContainer");
                  },
                  child: const Text("AnimatedContainer"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
