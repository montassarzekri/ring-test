import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velia_test/core/extensions/ext_buildcontext.dart';
import 'package:velia_test/core/styles/app_theme.dart';
import 'package:velia_test/core/styles/theme_colors.dart';
import 'package:velia_test/core/widgets/w_app_chip.dart';
import 'package:velia_test/core/widgets/w_app_text.dart';
import 'package:velia_test/features/tips/presentation/widgets/w_tips_caroussel.dart';

class TipsView extends StatefulWidget {
  const TipsView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TipsViewState();
  }
}

class _TipsViewState extends State<TipsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: ThemeColors.primaryGradient),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WTipCarousel(
                tips: [
                  TipCarouselItem(
                    title: 'Test 1',
                    body: 'Decription',
                    image: CachedNetworkImageProvider(
                      "https://images.unsplash.com/photo-1793022900358-0ae1e8e98934?q=80&w=989&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D",
                    ),
                  ),
                  TipCarouselItem(
                    title: 'Test 1',
                    body: 'Decription',
                    image: CachedNetworkImageProvider(
                      "https://plus.unsplash.com/premium_photo-1674203955445-d9b07c48bdbf?q=80&w=1035&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WAppText("You lifestyle", icon: Icons.person_outline),
                      SizedBox(height: 8),
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => AppChip.add(
                            label: ("Choice $index"),
                            onTap: () {},
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 5,
                          children: List.generate(
                            5,
                            (index) => AppChip.value(
                              label: ("Choice $index"),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FilledButton(
                onPressed: () {},
                child: Text("Learn more"),
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerLow,
                  foregroundColor: context.scheme.onSurface,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(66),
                    side: BorderSide(color: context.scheme.outlineVariant),
                  ),
                ),
              ),
              SafeArea(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
