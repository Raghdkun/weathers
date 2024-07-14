import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double fontsize;

  final Color color;
  final double height;
  const CustomButtonWidget(
      {super.key,
      this.onPressed,
      required this.text,
      required this.color,
      required this.height,
      required this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      height: height,
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: fontsize),
        ),
        style: ButtonStyle(),
      ),
    );
  }
}
