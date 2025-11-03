
import 'dart:math' as math;

import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

import '../app_config.dart';

class AnimatedCircularInnerShadowChart extends StatefulWidget {
  final double progress; // 0.0 - 1.0
  final double size;
  final Color color;
  final String title;
  final String subtitle;
  final Duration duration;

  const AnimatedCircularInnerShadowChart({
    super.key,
    required this.progress,
    required this.title,
    required this.subtitle,
    this.size = 90,
    this.color = Colors.red,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<AnimatedCircularInnerShadowChart> createState() =>
      _AnimatedCircularInnerShadowChartState();
}

class _AnimatedCircularInnerShadowChartState
    extends State<AnimatedCircularInnerShadowChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween<double>(
      begin: 0,
      end: widget.progress,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant AnimatedCircularInnerShadowChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress) {
      _animation = Tween<double>(begin: _animation.value, end: widget.progress)
          .animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
      );
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) {
        return Center(
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // ✅ Background with Inner Shadow
                SizedBox(
                  height: widget.size,
                  width: widget.size,
                  child: InnerShadow(
                      shadows: [
                        Shadow(
                            color: Colors.black.withValues(alpha:0.12),
                            blurRadius: 2.43,
                            offset: Offset(2, 2.43))
                      ],
                      child: Container(alignment: Alignment.center,

                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.shadow.withValues(alpha: .20)
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 8,top: 4,bottom: 8,right: 8),

                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white
                          ),
                        ),
                      )
                  ),
                ),

                // ✅ Circular Progress Painter
                CustomPaint(
                  size: Size(widget.size, widget.size),
                  painter: _CircularProgressPainter(
                    progress: _animation.value,
                    color: widget.color,
                  ),
                ),

                // ✅ Center Text
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        widget.title,
                        style: AppCss.soraMedium18
                    ),
                    Text(
                        widget.subtitle,
                        style: AppCss.soraMedium11.copyWith(color: AppColors.gary)
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color color;

  _CircularProgressPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth =8.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - strokeWidth / 2;

    final basePaint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..shader = SweepGradient(
        colors: [
          color.withValues(alpha:0.9),
          color.withValues(alpha:0.7),
          color.withValues(alpha:0.9),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw background circle
    canvas.drawCircle(center, radius, basePaint);

    // Draw progress arc
    final startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
    final indicatorAngle = startAngle + sweepAngle;

    final indicatorX = center.dx + radius * math.cos(indicatorAngle);
    final indicatorY = center.dy + radius * math.sin(indicatorAngle);

    // Draw white border for indicator
    final indicatorBorderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(indicatorX, indicatorY), 3, indicatorBorderPaint);

  }



  @override
  bool shouldRepaint(_CircularProgressPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}