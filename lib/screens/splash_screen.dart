import 'dart:async';
import 'dart:math';

import 'package:bautista_mobprog/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getIsLogin();
    super.initState();
  }

  void getIsLogin() {
    Timer(
      const Duration(seconds: 4),
      () => Navigator.popAndPushNamed(context, '/login')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: FB_DARK_PRIMARY,
        padding: const EdgeInsets.all(30),
        height: ScreenUtil().screenHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  const PulseLogo(),
                  SizedBox(height: ScreenUtil().setHeight(120)),
                  const CircularDotLoading(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PulseLogo extends StatefulWidget {
  const PulseLogo({super.key});

  @override
  State<PulseLogo> createState() => _PulseLogoState();
}

class _PulseLogoState extends State<PulseLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0.8,
      upperBound: 1.0,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _controller,
      child: Image.asset(
        'assets/images/doomscroll.png',
        height: ScreenUtil().setHeight(150),
      ),
    );
  }
}

class CircularDotLoading extends StatefulWidget {
  const CircularDotLoading({super.key});

  @override
  State<CircularDotLoading> createState() => _CircularDotLoadingState();
}

class _CircularDotLoadingState extends State<CircularDotLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final int dotCount = 7;
  final double radius = 20;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 4,
      height: radius * 4,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Stack(
            alignment: Alignment.center,
            children: List.generate(dotCount, (index) {
              final double angle =
                  (2 * 3.1415926535 / dotCount) * index + _controller.value * 2 * 3.1415926535;
              final double scale = 0.5 + 0.5 * (1 - (_controller.value - index / dotCount).abs() * dotCount).clamp(0.0, 1.0);
              return Transform.translate(
                offset: Offset(radius * cos(angle), radius * sin(angle)),
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: FB_PRIMARY,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
