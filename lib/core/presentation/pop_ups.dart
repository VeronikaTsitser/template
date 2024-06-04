import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> showAppCupertinoDialog<T>({required BuildContext context, required Widget child}) {
  return showCupertinoDialog<T>(context: context, builder: (BuildContext context) => child).then((value) {
    log('value: $value');
    return value;
  });
}

class DeleteAlertDialogWidget extends StatelessWidget {
  const DeleteAlertDialogWidget({
    super.key,
    required this.title,
    required this.confirmText,
    this.cancelText,
  });
  final String title;
  final String confirmText;
  final String? cancelText;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(cancelText ?? 'Отмена'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(confirmText),
        ),
      ],
    );
  }
}

class ConfirmDialogWidget extends StatelessWidget {
  const ConfirmDialogWidget({
    super.key,
    required this.title,
    required this.confirmText,
    this.cancelText,
  });
  final String title;
  final String confirmText;
  final String? cancelText;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      actions: [
        CupertinoDialogAction(
          child: Text(cancelText ?? 'Отмена'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(confirmText),
        ),
      ],
    );
  }
}

Future<T?> showAppActionSheet<T>({required BuildContext context, required Widget child}) {
  return showCupertinoModalPopup<T>(
    context: context,
    builder: (context) => child,
  ).then((value) {
    log('value: $value');
    return value;
  });
}

class EditDeleteActionSheet extends StatelessWidget {
  const EditDeleteActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          child: const Text('Редактировать'),
          onPressed: () => Navigator.pop(context, PopUpAction.edit),
        ),
        CupertinoActionSheetAction(
          child: const Text('Удалить данные', style: TextStyle(color: CupertinoColors.destructiveRed)),
          onPressed: () => Navigator.pop(context, PopUpAction.clear),
        )
      ],
    );
  }
}

enum PopUpAction { edit, clear }

Future<void> showAppImageDialog(BuildContext context, String path) =>
    showDialog(context: context, builder: (context) => ImageDialog(path: path));

class ImageDialog extends StatelessWidget {
  const ImageDialog({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.file(File(path), fit: BoxFit.cover),
          Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              child: const Icon(CupertinoIcons.xmark, size: 24, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
