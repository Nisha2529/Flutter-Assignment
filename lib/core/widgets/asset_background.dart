import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetBackground extends StatelessWidget {
  final List<String> assetCandidates;
  final Widget child;
  final BoxDecoration? fallbackDecoration;
  final BoxFit fit;
  final Alignment alignment;

  const AssetBackground({
    super.key,
    required this.assetCandidates,
    required this.child,
    this.fallbackDecoration,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.topCenter,
  });

  static bool _isSvg(String path) => path.toLowerCase().endsWith('.svg');

  Widget _buildImage(String asset) {
    if (_isSvg(asset)) {
      return SvgPicture.asset(
        asset,
        fit: fit,
        alignment: alignment,
        width: double.infinity,
      );
    }
    return Image.asset(
      asset,
      fit: fit,
      alignment: alignment,
      width: double.infinity,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (assetCandidates.isEmpty) {
      return Container(decoration: fallbackDecoration, child: child);
    }

    return Container(
      decoration: fallbackDecoration,
      child: Stack(
        fit: StackFit.expand,
        children: [_buildImage(assetCandidates.first), child],
      ),
    );
  }
}
