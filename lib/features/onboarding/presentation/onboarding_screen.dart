import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/presentation/widgets/app_progress_indicator.dart';
import '../domain/onboarding_state_enum.dart';
import '../logic/onboarding_notifier.dart';
import 'onboarding_body_1.dart';
import 'onboarding_body_2.dart';
import 'onboarding_body_3.dart';
import 'onboarding_body_4.dart';
import 'onboarding_body_5.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Header(),
              _Body(),
              _Button(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Button extends StatefulWidget {
  const _Button();

  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  // late final profileNotifier = context.read<ProfileNotifier>();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) => profileNotifier.addListener(_onListen));
  }

  void _onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<OnboardingNotifier>();
    final router = AutoRouter.of(context);

    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      // child: MediumButton(
      //   onPressed: () async {
      //     switch (notifier.state) {
      //       case OnboardingStateEnum.screen4:
      //         await OnboardingBody4.onPressed(context);
      //         break;
      //       case OnboardingStateEnum.screen5:
      //         await OnboardingBody5.onPressed(context);
      //         break;
      //       case OnboardingStateEnum.paywall:
      //         router.push(const HomeRoute()); //TODO
      //         break;
      //       default:
      //         notifier.nextState();
      //     }
      //   },

      //   isEnabled: switch (notifier.state) {
      //     // OnboardingStateEnum.screen4 => (profileNotifier.name != null && profileNotifier.name!.isNotEmpty),
      //     _ => true,
      //   },
      //   text: ' S.of(context).continueButton', //TODO
      // ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late final PageController _pageController;
  late final OnboardingNotifier notifier;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier = context.read<OnboardingNotifier>();
      _pageController = PageController(initialPage: notifier.state.index);

      notifier.addListener(_onListen);
      setState(() => isInitialized = true);
    });
  }

  void _onListen() {
    _pageController.animateToPage(
      notifier.state.index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    notifier.removeListener(_onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isInitialized
        ? Flexible(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) => setState(() {}),
              children: const [
                OnboardingBody1(),
                OnboardingBody2(),
                OnboardingBody3(),
                OnboardingBody4(),
                OnboardingBody5(),
                // PaywallBody(),
              ],
            ),
          )
        : const AppProgressIndicator();
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<OnboardingNotifier>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: OnboardingStateEnum.values
                .map(
                  (e) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      radius: 4,
                      // backgroundColor: notifier.state == e ? CustomColors.primaryLabel : CustomColors.secondaryLabel,//TODO
                    ),
                  ),
                )
                .toList(),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     if (notifier.state == OnboardingStateEnum.paywall) const AppCloseButton(),
          //     if (notifier.state == OnboardingStateEnum.paywall)
          //       ChipWidgetMicro(
          //         onTap: () {}, //TODO
          //         color: CustomColors.secondaryBackground,
          //         textColor: CustomColors.secondaryLabel,
          //         title: S.of(context).restore,
          //       )
          //   ],
          // ),
        ],
      ),
    );
  }
}
