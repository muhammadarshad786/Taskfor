import 'package:flutter/material.dart';
import 'package:task_app/responsive.dart';

class CustomButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onSubmit;

  CustomButtonWidget({
    required this.onSubmit,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
       SizeConfig().init(context);
    return MaterialButton(
      height: 58,
      minWidth: 380,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color(0xFFEC3F2E),
      onPressed: onSubmit,
      child: Text(
        label,
        style:const TextStyle(
          color: Colors.white,
          fontFamily: 'UrbanistRegular',
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),
      ),
    );
  }
}