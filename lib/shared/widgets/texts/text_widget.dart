import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(this.text,{ super.key,  double? cfontSize, this.textAlign}) : fontSize = cfontSize ?? 16;
  
  final String text;
  final double fontSize;
  final TextAlign? textAlign;    
  
  @override
  Widget build(BuildContext context) {
    return  Text(text,
      style: TextStyle (
        color: Colors.white,
        fontSize: fontSize),
      textAlign: textAlign,
      );
  }
}

