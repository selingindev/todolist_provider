import 'package:flutter/material.dart';

class IsLoadingWidgets extends StatelessWidget {
  const IsLoadingWidgets({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 3.0,
        );
  }
}