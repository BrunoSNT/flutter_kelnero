import 'package:flutter/material.dart';

class UnieButton extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final Duration duration;
  final Color color;
  final Color fgColor;
  final Color borderColor;
  final Color highlightColor;
  final Color hoverColor;
  final BorderRadius borderRadius;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Function onPress;
  final Widget innerWidget;

  UnieButton({
    this.text,
    this.width,
    this.height,
    this.duration,
    this.color,
    this.fgColor,
    this.borderColor,
    this.borderRadius,
    this.highlightColor,
    this.hoverColor,
    this.margin,
    this.padding,
    this.onPress,
    this.innerWidget,
  });

  @override
  _UnieButtonState createState() => _UnieButtonState(width: width, height: height);
}

class _UnieButtonState extends State<UnieButton> {
  double width, height;

  _UnieButtonState({width,height});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: this.widget.duration == null ? Duration(milliseconds: 100) : Duration(milliseconds: 100),
        width: this.widget.width,
        height: this.widget.height,
        margin: this.widget.margin,
        padding: this.widget.padding,
        decoration: BoxDecoration(
          color: this.widget.color,
          borderRadius: this.widget.borderRadius,
          border: Border.all(
            color: this.widget.borderColor ?? this.widget.color,
            width: 3.0,
            style: BorderStyle.solid,
          ),
        ),
        child: Center(child: this.widget.innerWidget),
      ),
      onTap: this.widget.onPress,
    );
  }
}
