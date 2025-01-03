import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic/onboarding_notifier.dart';

class OnboardingBody4 extends StatefulWidget {
  const OnboardingBody4({super.key});

  static Future<void> onPressed(BuildContext context) async {
    // final profileNotifier = context.read<ProfileNotifier>();
    final onboardingNotifier = context.read<OnboardingNotifier>();

    // await profileNotifier.updateProfile();

    onboardingNotifier.nextState();
  }

  @override
  State<OnboardingBody4> createState() => _OnboardingBody4State();
}

class _OnboardingBody4State extends State<OnboardingBody4> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // final profileNotifier = context.read<ProfileNotifier>();
    // if (profileNotifier.profile?.name != null) _controller.text = profileNotifier.profile!.name!;

    _controller.addListener(_onListen);
  }

  void _onListen() {
    // final profileNotifier = context.read<ProfileNotifier>();
    // profileNotifier.setName(_controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 80),
                Text(
                  'whatIsYourName', //TODO
                  // style: CustomText.bodyBoldLC,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                //TODO
                // NewMediumInput(
                //   controller: _controller,
                //   label: S.of(context).name,
                //   onChanged: (value) {
                //     // устанавливаем имя через Listener контроллера чтобы корректно обновлять состояние кнопки
                //   },
                // ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
