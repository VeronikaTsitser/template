import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> _checkPermission({
  required Permission permission,
  ValueChanged<bool>? requestResult,
  VoidCallback? onPermanentlyDenied,
}) async {
  final status = await permission.status;
  if (status == PermissionStatus.granted || status == PermissionStatus.limited) {
    return true;
  }
  final result = await permission.request();
  if (result == PermissionStatus.permanentlyDenied) {
    onPermanentlyDenied?.call();
  }
  final granted = result == PermissionStatus.granted || result == PermissionStatus.limited;
  requestResult?.call(granted);
  return granted;
}

Future<bool> checkPermissionCamera({ValueChanged<bool>? requestResult, VoidCallback? onPermanentlyDenied}) =>
    _checkPermission(
      permission: Permission.camera,
      requestResult: requestResult,
      onPermanentlyDenied: onPermanentlyDenied,
    );

Future<bool> checkPermissionPhotoGallery() async {
  if (Platform.isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    return androidInfo.version.sdkInt <= 32
        ? _checkPermission(permission: Permission.storage)
        : _checkPermission(permission: Permission.photos);
  }
  return _checkPermission(permission: Permission.photos);
}

Future<bool> requestPushNotifications() async {
  final result = await _checkPermission(permission: Permission.notification);
  return result;
}

Future<bool> checkAndRequestPermissionAppTrackingTransparency() async {
  final result = await _checkPermission(permission: Permission.appTrackingTransparency);
  return result;
}

Future<void> requestAppPermissionSettings() => openAppSettings();
