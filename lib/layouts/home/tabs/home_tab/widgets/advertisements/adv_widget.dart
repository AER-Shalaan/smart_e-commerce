import 'package:flutter/material.dart';

class AdvWidget extends StatelessWidget {
  const AdvWidget({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width >= 600 ? width : width * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
      ),
    );
  }
}
