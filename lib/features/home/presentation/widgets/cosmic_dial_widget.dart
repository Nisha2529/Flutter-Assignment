import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/home_data.dart';

class CosmicDialWidget extends StatefulWidget {
  final DateTime? birthDate;
  final CosmicTime? cosmicTime;
  final bool liveUpdate;
  final double? equatorY;

  const CosmicDialWidget({
    super.key,
    this.birthDate,
    this.cosmicTime,
    this.liveUpdate = true,
    this.equatorY,
  });

  @override
  State<CosmicDialWidget> createState() => _CosmicDialWidgetState();
}

class _CosmicDialWidgetState extends State<CosmicDialWidget> {
  Timer? _ticker;
  late CosmicTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = _computeCosmicTime();
    if (widget.liveUpdate && widget.cosmicTime == null) {
      _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
        if (mounted) {
          setState(() {
            _currentTime = _computeCosmicTime();
          });
        }
      });
    }
  }

  @override
  void didUpdateWidget(covariant CosmicDialWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cosmicTime != widget.cosmicTime ||
        oldWidget.birthDate != widget.birthDate) {
      _currentTime = _computeCosmicTime();
    }
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  CosmicTime _computeCosmicTime() {
    if (widget.cosmicTime != null) {
      return widget.cosmicTime!;
    }

    final birth = widget.birthDate ?? DateTime(2003, 11, 25);
    final now = DateTime.now();

    int years = now.year - birth.year;
    int months = now.month - birth.month;
    int days = now.day - birth.day;
    int hours = now.hour - birth.hour;
    int minutes = now.minute - birth.minute;
    int seconds = now.second - birth.second;

    if (seconds < 0) {
      minutes -= 1;
      seconds += 60;
    }
    if (minutes < 0) {
      hours -= 1;
      minutes += 60;
    }
    if (hours < 0) {
      days -= 1;
      hours += 24;
    }
    if (days < 0) {
      months -= 1;
      final prevMonthLastDay = DateTime(now.year, now.month, 0).day;
      days += prevMonthLastDay;
    }
    if (months < 0) {
      years -= 1;
      months += 12;
    }

    return CosmicTime(
      years: years >= 0 ? years : 0,
      months: months >= 0 ? months : 0,
      days: days >= 0 ? days : 0,
      hours: hours >= 0 ? hours : 0,
      minutes: minutes >= 0 ? minutes : 0,
      seconds: seconds >= 0 ? seconds : 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          painter: CosmicDialPainter(
            cosmicTime: _currentTime,
            equatorY: widget.equatorY,
          ),
        );
      },
    );
  }
}

class CosmicDialPainter extends CustomPainter {
  final CosmicTime cosmicTime;
  final double? equatorY;

  CosmicDialPainter({required this.cosmicTime, this.equatorY});

  static const List<Color> ringColors = [
    Color(0xFFFEFBEC),
    Color(0xFFFEF2C2),
    Color(0xFFDFD4AA),
    Color(0xFF659BA5),
    Color(0xFF84BAC4),
    Color(0xFFA9D1D9),
  ];

  static const List<String> ringLabels = [
    'Yrs',
    'Mm',
    'Days',
    'Hrs',
    'Mins',
    'Sec',
  ];

  static const List<double> activeFontSizes = [
    36.0,
    34.0,
    32.0,
    30.0,
    28.0,
    22.0,
  ];

  static const List<double> inactiveFontSizes = [
    24.0,
    22.0,
    20.0,
    18.0,
    16.0,
    10.0,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final cx = w;
    final cy = equatorY ?? (h * 0.88);
    final center = Offset(cx, cy);

    final rOuter = w * 0.84;
    final rCore = w * 0.14;
    final bandThickness = (rOuter - rCore) / 6.0;

    const startAngle = 0.5 * pi;
    const sweepAngle = pi;

    final corePaint = Paint()
      ..color = const Color(0xFFA9D1D9)
      ..style = PaintingStyle.fill;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: rCore),
      startAngle,
      sweepAngle,
      true,
      corePaint,
    );

    for (int i = 0; i < 6; i++) {
      final rMid = rOuter - (i + 0.5) * bandThickness;
      final paint = Paint()
        ..color = ringColors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = bandThickness + 0.6
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: rMid),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }

    const activeRayAngleFromBaseline = 46.0 * pi / 180.0;
    const activeRayAngle = pi + activeRayAngleFromBaseline;

    final values = [
      cosmicTime.years,
      cosmicTime.months,
      cosmicTime.days,
      cosmicTime.hours,
      cosmicTime.minutes,
      cosmicTime.seconds,
    ];

    const stepAngle = 11.5 * pi / 180.0;

    for (int i = 0; i < 6; i++) {
      final rMid = rOuter - (i + 0.5) * bandThickness;
      final val = values[i];

      for (int k = -3; k <= 3; k++) {
        final numVal = val + k;
        if (numVal < 0) continue;

        final angle = activeRayAngle + k * stepAngle;

        if (angle < (pi + 6.0 * pi / 180.0) || angle > (1.48 * pi)) {
          continue;
        }

        final isBold = (k == 0);
        final fontSize = isBold
            ? activeFontSizes[i].sp
            : inactiveFontSizes[i].sp;

        final textPainter = TextPainter(
          text: TextSpan(
            text: '$numVal',
            style: TextStyle(
              fontFamily: 'Agdasima',
              fontSize: fontSize,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
              color: isBold
                  ? const Color(0xFF191813)
                  : const Color(0xFF191813).withValues(alpha: 0.35),
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();

        final nx = cx + rMid * cos(angle);
        final ny = cy + rMid * sin(angle);

        canvas.save();
        canvas.translate(nx, ny);
        canvas.rotate(angle + pi / 2);
        textPainter.paint(
          canvas,
          Offset(-textPainter.width / 2, -textPainter.height / 2),
        );
        canvas.restore();
      }
    }

    for (int i = 0; i < 6; i++) {
      final rMid = rOuter - (i + 0.5) * bandThickness;
      final labelX = cx - rMid;
      final labelY = cy - 2.h;

      final labelPainter = TextPainter(
        text: TextSpan(
          text: ringLabels[i],
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF191813),
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      labelPainter.paint(
        canvas,
        Offset(
          labelX - labelPainter.width / 2,
          labelY - labelPainter.height / 2,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CosmicDialPainter oldDelegate) {
    return oldDelegate.cosmicTime != cosmicTime;
  }
}
