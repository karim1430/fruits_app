import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:developer';

/// A safe wrapper for SVG widgets that handles XML parsing errors gracefully
class SafeSvgWidget extends StatelessWidget {
  final String assetPath;
  final String? networkUrl;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  final Widget? fallbackWidget;

  const SafeSvgWidget.asset(
    this.assetPath, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.fit,
    this.fallbackWidget,
  }) : networkUrl = null;

  const SafeSvgWidget.network(
    this.networkUrl, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.fit,
    this.fallbackWidget,
  }) : assetPath = '';

  @override
  Widget build(BuildContext context) {
    final fallback =
        fallbackWidget ??
        SizedBox(
          width: width ?? 24,
          height: height ?? 24,
          child: Icon(Icons.broken_image, size: (width ?? 24) * 0.8),
        );

    if (networkUrl != null) {
      return SvgPicture.network(
        networkUrl!,
        width: width,
        height: height,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        fit: fit ?? BoxFit.contain,
        placeholderBuilder: (context) => fallback,
        errorBuilder: (context, error, stackTrace) {
          log('SVG network loading error for $networkUrl: $error');
          return fallback;
        },
      );
    } else {
      return SvgPicture.asset(
        assetPath,
        width: width,
        height: height,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        fit: fit ?? BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          log('SVG asset loading error for $assetPath: $error');
          return fallback;
        },
      );
    }
  }
}
