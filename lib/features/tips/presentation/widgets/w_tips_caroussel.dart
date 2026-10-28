import 'package:flutter/material.dart';

class TipCarouselItem {
  const TipCarouselItem({
    required this.title,
    required this.body,
    required this.image,
  });
  final String title;
  final String body;
  final ImageProvider image;
}

class WTipCarousel extends StatefulWidget {
  const WTipCarousel({
    super.key,
    required this.tips,
    this.initialPage = 0,
    this.onTap,
  });

  final List<TipCarouselItem> tips;
  final int initialPage;
  final ValueChanged<int>? onTap;

  @override
  State<WTipCarousel> createState() => _WTipCarouselState();
}

class _WTipCarouselState extends State<WTipCarousel> {
  static const _fraction = 0.62;
  static const _gap = 16.0;
  static const _aspect = 0.73;
  static const _sideScale = 0.86;

  late final _controller = PageController(
    viewportFraction: _fraction,
    initialPage: widget.initialPage,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double get _page =>
      _controller.hasClients && _controller.position.haveDimensions
      ? _controller.page!
      : widget.initialPage.toDouble();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, box) {
        final height = (box.maxWidth * _fraction - _gap) / _aspect;
        return SizedBox(
          height: height,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.tips.length,
            itemBuilder: (context, i) => AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final t = (_page - i).abs().clamp(0.0, 1.0);
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _gap / 2,
                    vertical: t * height * (1 - _sideScale) / 2,
                  ),
                  child: child,
                );
              },
              child: _TipCard(
                tip: widget.tips[i],
                onTap: widget.onTap == null ? null : () => widget.onTap!(i),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TipCard extends StatelessWidget {
  const _TipCard({required this.tip, this.onTap});

  final TipCarouselItem tip;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Material(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Ink(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: tip.image,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              cs.surface.withValues(alpha: 0.35),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tip.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: tt.headlineSmall?.copyWith(color: cs.onSurface),
                ),
                const Spacer(),
                Text(
                  tip.body,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: tt.bodyLarge?.copyWith(color: cs.onSurface),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
