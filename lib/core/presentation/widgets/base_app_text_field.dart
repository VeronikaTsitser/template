import 'package:archi_explorer/core/presentation/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseAppTextField<T> extends StatelessWidget {
  const BaseAppTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.iconPath,
    this.onChanged,
    this.enabled = true,
    required this.controller,
    this.isValidated = true,
    this.value,
    this.icon,
  });
  final String? labelText;
  final String? hintText;
  final String? iconPath;
  final ValueChanged<String?>? onChanged;
  final bool enabled;
  final bool isValidated;
  final TextEditingController controller;
  final T? value;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value?.toString(),
      controller: controller,
      style: AppTextStyle.s13w400,
      enabled: enabled,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hintText,
        hintStyle: AppTextStyle.s14w400.copyWith(color: AppColors.grey),
        filled: true,
        fillColor: AppColors.greyContainer,
        suffixIcon: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, child) {
            return Visibility(
              visible: value.text.isNotEmpty,
              child: IconButton(
                icon: const Icon(CupertinoIcons.xmark, size: 16),
                onPressed: () => controller.clear(),
              ),
            );
          },
        ),
        suffixIconColor: AppColors.grey,
        labelText: labelText,
        floatingLabelStyle: AppTextStyle.s11w400.copyWith(color: isValidated ? AppColors.grey : AppColors.red),
        labelStyle: AppTextStyle.s14w400.copyWith(color: isValidated ? AppColors.grey : AppColors.red),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.greyContainer),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.greyContainer),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.red),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      ),
    );
  }
}
