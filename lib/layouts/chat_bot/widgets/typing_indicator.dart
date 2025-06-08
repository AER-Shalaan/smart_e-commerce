import 'package:flutter/material.dart';

class TypingIndicator extends StatefulWidget {
  final Color flashingCircleBrightColor;
  final Color flashingCircleDarkColor;

  const TypingIndicator({
    super.key,
    this.flashingCircleBrightColor = Colors.grey,
    this.flashingCircleDarkColor = Colors.black54,
  });

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    _animation1 = _buildAnimation(0.0, 0.6);
    _animation2 = _buildAnimation(0.2, 0.8);
    _animation3 = _buildAnimation(0.4, 1.0);
  }

  Animation<double> _buildAnimation(double start, double end) {
    return Tween(begin: 0.0, end: 8.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeInOut),
      ),
    );
  }

  Widget _dot(Animation<double> animation) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -animation.value),
            child: Dot(
              brightColor: widget.flashingCircleBrightColor,
              darkColor: widget.flashingCircleDarkColor,
            ),
          );
        },
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _dot(_animation1),
        _dot(_animation2),
        _dot(_animation3),
      ],
    );
  }
}

class Dot extends StatelessWidget {
  final Color brightColor;
  final Color darkColor;

  const Dot({
    super.key,
    required this.brightColor,
    required this.darkColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [brightColor, darkColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
