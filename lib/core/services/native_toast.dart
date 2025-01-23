import 'package:fluttertoast/fluttertoast.dart';

Future<void> showToast(String message) async {
  await Fluttertoast.showToast(msg: message);
}

Future<void> showToastOnTop(String message) async {
  await Fluttertoast.showToast(msg: message, gravity: ToastGravity.TOP);
}
