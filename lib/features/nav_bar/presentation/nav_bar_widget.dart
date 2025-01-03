import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/core/presentation/theme.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context, watch: true);
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        border: Border(top: BorderSide(color: AppColors.primary, width: 0.5)),
        // color: Colors.red,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarItem(
            title: 'Заметки',
            iconPath: 'assets/svg/notebook.svg',
            isSelected: tabsRouter.activeIndex == 0,
            onTap: () => tabsRouter.setActiveIndex(0),
          ),
          // NavBarItem(
          //   title: 'Задачи',
          //   iconPath: 'assets/svg/bullseye_arrow.svg',
          //   isSelected: tabsRouter.activeIndex == 1,
          //   onTap: () => tabsRouter.setActiveIndex(1),
          // ),
          // NavBarItem(
          //     title: 'Продуктивность',
          //     iconPath: 'assets/svg/presentation_chart_alt.svg',
          //     isSelected: tabsRouter.activeIndex == 2,
          //     onTap: () => tabsRouter.setActiveIndex(2)),
          // NavBarItem(
          //   title: 'Архив',
          //   iconPath: 'assets/svg/box_archive.svg',
          //   isSelected: tabsRouter.activeIndex == 3,
          //   onTap: () => tabsRouter.setActiveIndex(3),
          // ),
          // NavBarItem(
          //   title: 'Настройки',
          //   iconPath: 'assets/svg/gear.svg',
          //   isSelected: tabsRouter.activeIndex == 4,
          //   onTap: () => tabsRouter.setActiveIndex(4),
          // ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: AppColors.primary,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  iconPath,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                SizedBox(width: 5),
                Text(title, style: AppTextStyle.s11w400.copyWith(color: Colors.white)),
              ],
            ),
          )
        : InkWell(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            onTap: onTap,
            child: SvgPicture.asset(
              iconPath,
              colorFilter: const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
            ),
          );
  }
}
