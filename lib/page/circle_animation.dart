import 'dart:ui';

import 'package:flutter/material.dart';

class GrowingCircle extends StatefulWidget {
  final double startDiameter;
  final double endDiameter;

  GrowingCircle({required this.startDiameter, required this.endDiameter});

  @override
  _GrowingCircleState createState() => _GrowingCircleState();
}

class _GrowingCircleState extends State<GrowingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    // _controller.repeat(reverse: true);
    _controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GrowingCirclePainter(
        value: _animation.value,
        startDiameter: widget.startDiameter,
        endDiameter: widget.endDiameter,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class GrowingCirclePainter extends CustomPainter {
  final double value;
  final double startDiameter;
  final double endDiameter;

  GrowingCirclePainter(
      {required this.value,
        required this.startDiameter,
        required this.endDiameter});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = lerpDouble(startDiameter, endDiameter, value);

    final paint = Paint()
      ..color = Colors.white.withOpacity(1 - value)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    canvas.drawCircle(center, radius!, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class CircleAnimationPage extends StatelessWidget {
  const CircleAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Growing Circle Animation'),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: GrowingCircle( startDiameter: 50,
            endDiameter: 100,),
        ),
      ),
    );
  }
}

