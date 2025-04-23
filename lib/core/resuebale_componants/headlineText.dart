import 'package:flutter/material.dart';

class Headlinetext extends StatelessWidget {
  final String text;
  const Headlinetext({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headlineLarge);
  }
}
