import 'package:flutter/material.dart';
import 'package:network_topology_gis/src/config/app_theme.dart';

class KText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final bool? bold;

  const KText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.maxLines,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: fontSize != null ? fontSize! : 13,
        fontWeight: fontWeight,
        fontFamily: bold! ? 'Manrope Bold' : 'Manrope Regular',
        color: color ?? AppTheme.textColor,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
