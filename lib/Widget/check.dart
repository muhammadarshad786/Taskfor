import 'package:flutter/material.dart';
import 'package:task_app/responsive.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({Key? key}) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
       SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: _isChecked ? Color(0xFFEC3F2E) : Colors.white, 

          border: Border.all(
            color: Color(0xFFEC3F2E), 
            width: 2.0, 
          ),
          borderRadius: BorderRadius.circular(8.0), 
        ),
        child: Center(
          child: Icon(
            _isChecked ? Icons.check : null,
            color: Colors.white, 
            size: 50.0, 
          ),
        ),
      ),
    );
  }
}
