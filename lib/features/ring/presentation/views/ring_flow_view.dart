import 'package:flutter/material.dart';
import 'package:velia_test/core/router/app_router.dart';
import 'package:velia_test/core/styles/theme_colors.dart';
import 'package:velia_test/features/ring/presentation/widgets/w_tips_caroussel.dart';

class RingFlowView extends StatefulWidget {
  const RingFlowView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RingFlowViewState();
  }
}

class _RingFlowViewState extends State<RingFlowView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: ThemeColors.primaryGradient),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: WStepFlow(
            onDone: () {},
            steps: [
              FlowStep(
                body: Container(),
                action: 'Connect your ring',
                // onNext:(),
                secondary: (
                  label: 'Connect later',
                  onTap: () {
                    AppRouter.replaceAll(AppRouter.welcome);
                  },
                ),
              ),
              FlowStep(body: Container(), action: 'Continue'),
              FlowStep(
                body: Container(),
                action: 'Continue',
                showProgress: true,
              ),
              FlowStep(
                body: Container(),
                action: 'Continue',
                showProgress: true,
              ),
              FlowStep(
                body: Container(),
                action: 'Start using Velia',
                showProgress: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
