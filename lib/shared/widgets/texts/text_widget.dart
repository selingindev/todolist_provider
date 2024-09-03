import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(this.text,{ super.key, Color? ccolor,  double? cfontSize, this.textAlign}) : fontSize = cfontSize ?? 16,  color = ccolor ?? Colors.white;
  
  final String text;
  final double fontSize;
  final TextAlign? textAlign;    
  final Color color;
  
  @override
  Widget build(BuildContext context) {
    return  Text(text,
      style: TextStyle (
        color: color,
        fontSize: fontSize),
      textAlign: textAlign,
      );
  }
}

