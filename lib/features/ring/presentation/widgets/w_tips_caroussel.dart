import 'package:flutter/material.dart';

class FlowStep {
  const FlowStep({
    required this.body,
    required this.action,
    this.onNext,
    this.secondary,
    this.showProgress = false,
  });

  final Widget body;
  final String action;
  final Future<bool> Function()? onNext;
  final ({String label, VoidCallback onTap})? secondary;
  final bool showProgress;
}

class WStepFlow extends StatefulWidget {
  const WStepFlow({super.key, required this.steps, required this.onDone});

  final List<FlowStep> steps;
  final VoidCallback onDone;

  @override
  State<WStepFlow> createState() => _WStepFlowState();
}

class _WStepFlowState extends State<WStepFlow> {
  int _i = 0;
  bool _busy = false;

  FlowStep get _step => widget.steps[_i];
  bool get _isLast => _i == widget.steps.length - 1;

  Future<void> _next() async {
    if (_step.onNext != null) {
      setState(() => _busy = true);
      final ok = await _step.onNext!();
      if (!mounted) return;
      setState(() => _busy = false);
      if (!ok) return;
    }
    _isLast ? widget.onDone() : setState(() => _i++);
  }

  void _back() => setState(() => _i--);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final secondary = _step.secondary;

    return PopScope(
      canPop: _i == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _back();
      },
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [cs.surfaceContainerHigh, cs.surface],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 48,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _i > 0
                          ? IconButton(
                              onPressed: _back,
                              icon: const Icon(Icons.arrow_back),
                              color: cs.onSurfaceVariant,
                            )
                          : null,
                    ),
                  ),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: KeyedSubtree(key: ValueKey(_i), child: _step.body),
                    ),
                  ),
                  if (_step.showProgress) ...[
                    _Progress(count: widget.steps.length, filled: _i + 1),
                    const SizedBox(height: 16),
                  ],
                  _Button(
                    label: _step.action,
                    onTap: _busy ? null : _next,
                    background: cs.onSurface,
                    foreground: cs.surface,
                  ),
                  if (secondary != null) ...[
                    const SizedBox(height: 12),
                    _Button(
                      label: secondary.label,
                      onTap: _busy ? null : secondary.onTap,
                      background: cs.surfaceContainerHighest,
                      foreground: cs.onSurface,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Progress extends StatelessWidget {
  const _Progress({required this.count, required this.filled});

  final int count;
  final int filled;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      spacing: 4,
      children: [
        for (var i = 0; i < count; i++)
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 2,
              color: i < filled ? cs.onSurface : cs.outlineVariant,
            ),
          ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.label,
    required this.onTap,
    required this.background,
    required this.foreground,
  });

  final String label;
  final VoidCallback? onTap;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap,
      style: FilledButton.styleFrom(
        backgroundColor: background,
        foregroundColor: foreground,
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: Theme.of(context).textTheme.labelLarge,
      ),
      child: Text(label),
    );
  }
}
