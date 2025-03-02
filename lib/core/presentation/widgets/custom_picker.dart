import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class CustomPicker<T> extends StatefulWidget {
  final List<T> items;
  final T selectedItem;
  final String Function(T) getTitle;
  final IconData Function(T)? getIcon;
  final ValueChanged<T> onSelected;
  final Color? buttonBackgroundColor;
  final Widget? child;
  final bool removeChecks;

  const CustomPicker({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.getTitle,
    this.getIcon,
    required this.onSelected,
    this.buttonBackgroundColor,
    this.child,
    this.removeChecks = false,
  });

  @override
  State<CustomPicker<T>> createState() => _CustomPickerState<T>();
}

class _CustomPickerState<T> extends State<CustomPicker<T>> {
  OverlayEntry? _overlayEntry;
  bool _isMenuOpen = false;
  final double itemHeight = 42;

  void _toggleMenu(BuildContext context) {
    _isMenuOpen ? _closeMenu() : _openMenu(context);
  }

  void _closeMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isMenuOpen = false);
  }

  void _openMenu(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final Offset offset = renderBox.localToGlobal(Offset.zero);

      _overlayEntry = OverlayEntry(
        builder: (context) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Фон для закрытия меню при нажатии вне его
              GestureDetector(
                onTap: _closeMenu,
                child: Container(color: Colors.transparent),
              ),
              Positioned(
                top: offset.dy - widget.items.length * itemHeight,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 240,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: AppBorderRadius.all16,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: widget.items.map((item) {
                        return InkWell(
                          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                          onTap: () {
                            widget.onSelected(item);
                            _closeMenu();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: widget.items.indexOf(item) != widget.items.length - 1
                                  ? const Border(bottom: BorderSide(color: CupertinoColors.systemGrey6))
                                  : null,
                            ),
                            height: itemHeight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  if (!widget.removeChecks) ...[
                                    item == widget.selectedItem
                                        ? const Icon(CupertinoIcons.check_mark, size: 12)
                                        : const SizedBox.square(dimension: 12),
                                    const SizedBox(width: 8)
                                  ],
                                  Expanded(
                                    child: Text(
                                      widget.getTitle(item),
                                      style: AppTextStyle.s14w400,
                                    ),
                                  ),
                                  if (widget.getIcon != null) Icon(widget.getIcon!(item)),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );

      Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
      setState(() => _isMenuOpen = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: () => _toggleMenu(context),
      child: widget.child ??
          DefaultChild(
            isMenuOpen: _isMenuOpen,
            buttonBackgroundColor: widget.buttonBackgroundColor,
            getIcon: widget.getIcon,
            selectedItem: widget.selectedItem,
            getTitle: widget.getTitle,
          ),
    );
  }
}

class DefaultChild<T> extends StatelessWidget {
  const DefaultChild({
    super.key,
    required this.isMenuOpen,
    required this.buttonBackgroundColor,
    required this.getIcon,
    required this.selectedItem,
    required this.getTitle,
  });

  final Color? buttonBackgroundColor;
  final IconData Function(T)? getIcon;
  final T selectedItem;
  final String Function(T) getTitle;
  final bool isMenuOpen;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: buttonBackgroundColor ?? AppColors.greyContainer,
        borderRadius: AppBorderRadius.all16,
      ),
      foregroundDecoration: isMenuOpen
          ? BoxDecoration(color: AppColors.greyContainer.withValues(alpha: 0.5), borderRadius: AppBorderRadius.all16)
          : null,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (getIcon != null) ...[
            Icon(getIcon!(selectedItem), size: 24),
            const SizedBox(width: 12),
          ],
          Text(getTitle(selectedItem), style: AppTextStyle.s14w400),
          const SizedBox(width: 6),
          const Icon(
            CupertinoIcons.chevron_up_chevron_down,
            color: AppColors.black,
            size: 16,
          ),
        ],
      ),
    );
  }
}
