import 'dart:developer';

import 'package:archi_explorer/core/presentation/theme.dart';
import 'package:flutter/cupertino.dart';

class BaseAppDatePicker extends StatefulWidget {
  const BaseAppDatePicker({super.key, required this.initialDate, this.minimumDate, this.maximumDate});
  final DateTime initialDate;
  final DateTime? minimumDate;
  final DateTime? maximumDate;

  @override
  State<BaseAppDatePicker> createState() => _BaseAppDatePickerState();
}

class _BaseAppDatePickerState extends State<BaseAppDatePicker> {
  late DateTime _value = widget.initialDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.greyContainer,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                maximumDate: widget.maximumDate,
                minimumDate: widget.minimumDate,
                mode: CupertinoDatePickerMode.date,
                initialDateTime: widget.initialDate,
                onDateTimeChanged: (DateTime newDate) {
                  _value = newDate;
                },
              ),
            ),
            // Close the modal
            CupertinoButton(
              child: const Text('OK', style: AppTextStyle.s15w500),
              onPressed: () => Navigator.of(context).pop(_value),
            )
          ],
        ),
      ),
    );
  }
}

class BaseAppMonthPicker extends StatefulWidget {
  const BaseAppMonthPicker({super.key, this.initialDate, this.minimumDate, this.maximumDate});
  final DateTime? initialDate;
  final DateTime? minimumDate;
  final DateTime? maximumDate;

  @override
  State<BaseAppMonthPicker> createState() => _BaseAppMonthPickerState();
}

class _BaseAppMonthPickerState extends State<BaseAppMonthPicker> {
  late DateTime? _value = widget.initialDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.greyContainer,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: CupertinoTheme(
                data: const CupertinoThemeData(brightness: Brightness.dark),
                child: CupertinoDatePicker(
                  maximumDate: widget.maximumDate,
                  minimumDate: widget.minimumDate,
                  mode: CupertinoDatePickerMode.monthYear,
                  initialDateTime: widget.initialDate,
                  onDateTimeChanged: (DateTime newDate) {
                    _value = newDate;
                  },
                ),
              ),
            ),
            // Close the modal
            CupertinoButton(
              child: const Text('OK', style: AppTextStyle.s15w500),
              onPressed: () => Navigator.of(context).pop(_value),
            )
          ],
        ),
      ),
    );
  }
}

Future<DateTime?> showAppTimePicker({required BuildContext context, required Widget child}) => showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => child,
    ).then((value) {
      log('value: $value');
      return value;
    });

class BaseAppTimePicker extends StatefulWidget {
  const BaseAppTimePicker({
    super.key,
    required this.initialTime,
    this.minimumDate,
    this.maximumDate,
  });
  final DateTime initialTime;
  final DateTime? minimumDate;
  final DateTime? maximumDate;

  @override
  State<BaseAppTimePicker> createState() => _BaseAppTimePickerState();
}

class _BaseAppTimePickerState extends State<BaseAppTimePicker> {
  late DateTime value = widget.initialTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.greyContainer,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: CupertinoTheme(
                data: const CupertinoThemeData(brightness: Brightness.dark),
                child: CupertinoDatePicker(
                  maximumDate: widget.maximumDate,
                  minimumDate: widget.minimumDate,
                  use24hFormat: true,
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: widget.initialTime,
                  onDateTimeChanged: (DateTime newTime) => value = newTime,
                ),
              ),
            ),
            CupertinoButton(
              child: const Text('OK', style: AppTextStyle.s15w500),
              onPressed: () => Navigator.pop(context, value),
            ),
          ],
        ),
      ),
    );
  }
}
