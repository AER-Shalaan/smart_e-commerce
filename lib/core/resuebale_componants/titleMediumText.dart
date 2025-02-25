import 'package:flutter/material.dart';

class TitleMediumtext extends StatelessWidget {
  final String text;
  final double opacity;
  final double? fontSize;
  const TitleMediumtext({super.key,required this.text,required this.opacity,this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: Theme.of(context).textTheme.titleMedium?.copyWith(
      color: Theme.of(context).colorScheme.primary.withOpacity(opacity),
      fontSize: fontSize),
    );
  }
}
