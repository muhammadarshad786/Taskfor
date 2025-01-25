import 'package:flutter/material.dart';
import 'package:task_app/responsive.dart';

class NeumorphicButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const NeumorphicButton({
    required this.onPressed,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
       SizeConfig().init(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 139,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
      
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 60,
              spreadRadius: 1,
              offset: Offset(-5, -5),
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              blurRadius: 15,
              spreadRadius: 1,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}