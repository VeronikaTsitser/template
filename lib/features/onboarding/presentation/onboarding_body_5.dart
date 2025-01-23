import 'package:flutter/cupertino.dart';

class OnboardingBody5 extends StatelessWidget {
  const OnboardingBody5({super.key});

  @override
  Widget build(BuildContext context) {
    // final profileNotifier = context.watch<ProfileNotifier>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 80),
                //TODO
                // Text(
                //   S.of(context).selectYourDateOfBirth,
                //   style: CustomText.bodyBoldLC,
                //   textAlign: TextAlign.center,
                // ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        child: CupertinoDatePicker(
                            maximumDate: DateTime(DateTime.now().year - 5),
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: DateTime(DateTime.now().year - 20, 7, 1),
                            onDateTimeChanged: (DateTime newDate) {} //TODO
                            // => profileNotifier.setBirthDate(newDate),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> onPressed(BuildContext context) async {
    // TODO
    // final profileNotifier = context.read<ProfileNotifier>();
    // final onboardingNotifier = context.read<OnboardingNotifier>();
    // await profileNotifier.updateProfile();
    // onboardingNotifier.nextState();
  }
}
