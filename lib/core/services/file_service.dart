import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> _checkPermission({
  required Permission permission,
}) async {
  final status = await permission.status;
  log('status: $status');
  if (status == PermissionStatus.granted || status == PermissionStatus.limited) {
    return true;
  }
  final result = await permission.request();
  log('result: $result');
  return result == PermissionStatus.granted || result == PermissionStatus.limited;
}

Future<bool> checkPermissionCamera() => _checkPermission(permission: Permission.camera);

Future<bool> checkPermissionPhotoGallery() async {
  return _checkPermission(permission: Permission.photos);
}

Future<void> requestAppPermissionSettings() => openAppSettings();

Future<List<String>> getImage({required bool fromGallery}) async {
  final picker = ImagePicker();
  final pickedFiles = fromGallery
      ? await picker.pickMultiImage().then((value) => value.map((e) => e.path).toList())
      : await picker.pickImage(source: ImageSource.camera).then((value) => [value!.path]);
  return pickedFiles;
}

Future<String> saveImagePermanently(String path) async {
  final fileName = path.split('/').last;
  final dir = await getApplicationDocumentsDirectory();
  final newPath = '${dir.path}/$fileName';
  final file = await File(path).copy(newPath);
  return file.path;
}

Future<void> deleteImage(String path) async {
  final file = File(path);
  await file.delete();
}
