import 'package:flutter/material.dart';

class AppChip extends StatelessWidget {
  const AppChip.add({super.key, required this.label, required this.onTap})
    : _filled = false;

  const AppChip.value({super.key, required this.label, required this.onTap})
    : _filled = true;

  final String label;
  final VoidCallback onTap;
  final bool _filled;

  static const double _height = 40;
  static const double _radius = 14;
  static const double _iconSize = 16;
  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textStyle = Theme.of(
      context,
    ).textTheme.titleMedium?.copyWith(color: cs.onSurface);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_radius),
      side: _filled ? BorderSide.none : BorderSide(color: cs.outlineVariant),
    );

    return Material(
      shape: shape,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: _height,
          child: Padding(
            padding: _padding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: textStyle),
                SizedBox(width: _filled ? 12 : 8),
                Icon(
                  _filled ? Icons.play_arrow_rounded : Icons.add,
                  size: _iconSize,
                  color: cs.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
