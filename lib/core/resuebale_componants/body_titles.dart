import 'package:flutter/material.dart';

class BodyTitles extends StatelessWidget {
  const BodyTitles({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
