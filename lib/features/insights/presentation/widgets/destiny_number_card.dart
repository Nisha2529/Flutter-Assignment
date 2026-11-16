import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DestinyNumberCard extends StatelessWidget {
  final int destinyNumber;
  final String destinyTitle;

  const DestinyNumberCard({
    super.key,
    required this.destinyNumber,
    required this.destinyTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Image.asset(
        'assets/images/destinity.png',
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
