import 'package:flutter/material.dart';

class TypingIndicator extends StatefulWidget {
  final Color? brightColor;
  final Color? darkColor;

  const TypingIndicator({
    super.key,
    this.brightColor,
    this.darkColor,
  });

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat();

    _animations = [
      _buildAnimation(0.0),
      _buildAnimation(0.2),
      _buildAnimation(0.4),
    ];
  }

  Animation<double> _buildAnimation(double delay) {
    return Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(delay, delay + 0.6, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightColor = widget.brightColor ?? Theme.of(context).colorScheme.primary;
    final darkColor = widget.darkColor ?? Colors.grey[400]!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        return AnimatedBuilder(
          animation: _animations[i],
          builder: (_, __) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Opacity(
                opacity: _animations[i].value,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.lerp(darkColor, brightColor, _animations[i].value),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
