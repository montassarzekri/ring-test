import 'package:flutter/material.dart';

enum TextVariant {
  display,
  headline,
  title,
  body,
  label,
  caption;

  TextStyle? of(TextTheme t) => switch (this) {
    TextVariant.display => t.displayMedium,
    TextVariant.headline => t.headlineSmall,
    TextVariant.title => t.titleMedium,
    TextVariant.body => t.bodyMedium,
    TextVariant.label => t.labelLarge,
    TextVariant.caption => t.bodySmall,
  };
}

/// Theme-locked replacement for [Text].
///   WAppText('Your lifestyle', icon: Icons.person_outline)
///   WAppText('Gentle insights…', muted: true)
///   WAppText.rich(TextSpan(...), variant: TextVariant.display)
class WAppText extends StatelessWidget {
  const WAppText(
    String this.data, {
    super.key,
    this.variant = TextVariant.body,
    this.muted = false,
    this.icon,
    this.gap = 8,
    this.align,
    this.maxLines,
  }) : span = null;

  const WAppText.rich(
    InlineSpan this.span, {
    super.key,
    this.variant = TextVariant.body,
    this.muted = false,
    this.icon,
    this.gap = 8,
    this.align,
    this.maxLines,
  }) : data = null;

  final String? data;
  final InlineSpan? span;
  final TextVariant variant;
  final bool muted; // → colorScheme.onSurfaceVariant
  final IconData? icon; // leading, sized & colored from the text style
  final double gap;
  final TextAlign? align;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = variant
        .of(theme.textTheme)
        ?.copyWith(color: muted ? theme.colorScheme.onSurfaceVariant : null);

    final InlineSpan content = span ?? TextSpan(text: data);

    return Text.rich(
      icon == null
          ? content
          : TextSpan(
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: gap),
                    child: Icon(
                      icon,
                      size: (style?.fontSize ?? 14) * 1.15,
                      color: style?.color,
                      applyTextScaling: true,
                    ),
                  ),
                ),
                content,
              ],
            ),
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }
}
