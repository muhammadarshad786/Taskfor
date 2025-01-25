import 'dart:math';
import 'package:flutter/material.dart';
import 'package:task_app/profile/profile_screen.dart';
import 'package:task_app/responsive.dart';

import 'Authentication_Screen/login_screen.dart';
import 'Authentication_Screen/registeration_page.dart';
import 'Home/home_screen.dart';

class Splash extends StatefulWidget {

  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isRemembered = false;
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    _checkRememberStatus().then((_) {
      Future.delayed(const Duration(seconds: 10), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            if (email.isNotEmpty && _isRemembered == true) {
              return Home();
            } else {
              return LoginScreen(); //LoginScreen
            }
          }),
        );
      });
    }); }
  Future<void> _checkRememberStatus() async {
    // final prefs = await SharedPreferences.getInstance();
    // final rem = prefs.getBool('Remember') ?? false;
    // final emaill = prefs.getString('Email') ?? '';
    // final passwordss = prefs.getString('Password') ?? '';
    // setState(() {
    //   _isRemembered = rem;
    //   email = emaill;
    //   password = passwordss;
    // });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Center(child: Image.asset('assets/Icons/splash.png', height: 100)),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20,top: 250),
            child: Center(
              child:  AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CustomPaint(
                    size: const Size(100, 100),
                    painter: DotPainter(_controller.value),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class DotPainter extends CustomPainter {
  final double animationValue;
  final List<double> dotSizes = [5, 7, 10, 13, 15, 17, 19, 23];

  DotPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 3; 
    final totalDots = dotSizes.length;
    final angleStep = (2 * pi) / totalDots;

    for (int i = 0; i < totalDots; i++) {
      final angle = angleStep * i + animationValue * 2 * pi; 
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);

      final pulsingFactor = 1.0 + sin(animationValue * 4 * pi + i * pi / 2) * 0.2;
      final dotRadius = (dotSizes[i] * pulsingFactor) / 2;

      canvas.drawCircle(Offset(x, y), dotRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
