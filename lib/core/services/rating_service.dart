import 'dart:developer';

import 'package:in_app_review/in_app_review.dart';

Future<void> showAppRating() async {
  final inAppReview = InAppReview.instance;
  try {
    final isAvailable = await inAppReview.isAvailable();
    log('Rating is available $isAvailable');
    if (isAvailable) {
      log('Rating requestReview');
      await inAppReview.requestReview();
    } else {
      log('Rating openStoreListing');
      await inAppReview.openStoreListing(appStoreId: '');
    }
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
  }
}
