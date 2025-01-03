import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/core/presentation/theme.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        side: BorderSide(
          color: AppColors.primary,
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      automaticallyImplyLeading: false,
      title: Text(title, style: AppTextStyle.s17w700),
      leading: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: SvgPicture.asset(
          'assets/svg/chevron_left.svg',
          width: 24,
          height: 24,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
