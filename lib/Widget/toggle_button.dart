import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final double width;
  final double height;

  final String leftDescription;
  final String rightDescription;

  final Color toggleColor;
  final Color toggleBackgroundColor;
  final Color toggleBorderColor;

  final Color inactiveTextColor;
  final Color activeTextColor;

  final double _leftToggleAlign = -1;
  final double _rightToggleAlign = 1;

  final VoidCallback onLeftToggleActive;
  final VoidCallback onRightToggleActive;

  const ToggleButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.toggleBackgroundColor,
      required this.toggleBorderColor,
      required this.toggleColor,
      required this.activeTextColor,
      required this.inactiveTextColor,
      required this.leftDescription,
      required this.rightDescription,
      required this.onLeftToggleActive,
      required this.onRightToggleActive})
      : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  double _toggleXAlign = -1;

  late Color _leftDescriptionColor;
  late Color _rightDescriptionColor;

  @override
  void initState() {
    super.initState();

    _leftDescriptionColor = widget.activeTextColor;
    _rightDescriptionColor = widget.inactiveTextColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.toggleBackgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
         boxShadow: [
      
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(-5, -5),
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.9),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(5, 5),
            ),
          ],
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(_toggleXAlign, 0),
            duration: Duration(milliseconds: 300),
            child: Container(
              width: widget.width * 0.5,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.toggleColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  _toggleXAlign = widget._rightToggleAlign;

                  _leftDescriptionColor = widget.inactiveTextColor;
                  _rightDescriptionColor = widget.activeTextColor;
                },
              );

              widget.onRightToggleActive();
            },
            child: Align(
              alignment: Alignment(-1, 0),
              child: Container(
                width: widget.width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  widget.leftDescription,
                  style: TextStyle(
                      color: _leftDescriptionColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  _toggleXAlign = widget._leftToggleAlign;

                  _leftDescriptionColor = widget.activeTextColor;
                  _rightDescriptionColor = widget.inactiveTextColor;
                },
              );

              widget.onLeftToggleActive();
            },
            child: Align(
              alignment: Alignment(1, 0),
              child: Container(
                width: widget.width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  widget.rightDescription,
                  style: TextStyle(
                      color: _rightDescriptionColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}