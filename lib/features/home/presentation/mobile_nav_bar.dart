import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/presentation/theme.dart';

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context, watch: true);
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.bg,
          border: Border(top: BorderSide(color: AppColors.grey, width: 1)),
        ),
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 10),
        child: Row(
          children: [
            _NavButton(
              onPressed: () => tabsRouter.setActiveIndex(0),
              isActive: tabsRouter.activeIndex == 0,
              icon: CupertinoIcons.moon_stars_fill,
              title: 'title',
            ),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.isActive,
    required this.onPressed,
    required this.icon,
    required this.title,
    this.flex,
  });

  final bool isActive;
  final VoidCallback onPressed;
  final IconData icon;
  final String title;
  final int? flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 3,
      child: GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.translucent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24,
              child: Icon(
                icon,
                color: isActive ? AppColors.black : AppColors.grey,
              ),
            ),
            const SizedBox(height: 2),
            AutoSizeText(
              title,
              style: AppTextStyle.s11w400.copyWith(
                color: isActive ? AppColors.black : AppColors.grey,
              ),
              maxLines: 1,
              minFontSize: 6,
            ),
          ],
        ),
      ),
    );
  }
}
