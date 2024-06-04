import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

String formatTime(DateTime dateTime) {
  return DateFormat('HH:mm').format(dateTime);
}

String formatDateDayMonth(DateTime date) {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime aDate = DateTime(date.year, date.month, date.day);

  if (aDate == today) {
    return 'Сегодня';
  }
  if (aDate == today.subtract(const Duration(days: 1))) {
    return 'Вчера';
  }
  if (aDate.year != today.year) {
    return DateFormat('d MMMM y', 'ru_RU').format(date);
  } else {
    return DateFormat('d MMMM', 'ru_RU').format(date);
  }
}

String formatDateNow() {
  final date = DateTime.now();
  return DateFormat('d MMMM', 'ru_RU').format(date);
}

String formatDuration(Duration duration) {
  int hours = duration.inHours;
  int minutes = duration.inMinutes.remainder(60);

  String hourSuffix = hours == 1
      ? 'час'
      : hours < 5
          ? 'часа'
          : 'часов';
  String minuteSuffix = minutes == 1 ? 'минута' : 'минут';

  String hourString = '$hours $hourSuffix';
  String minuteString = '$minutes $minuteSuffix';

  if (hours == 0) {
    return minuteString;
  } else if (minutes == 0) {
    return hourString;
  } else {
    return '$hourString $minuteString';
  }
}

String formatDate(DateTime dateTime) {
  final Map<int, String> months = {
    1: 'января',
    2: 'февраля',
    3: 'марта',
    4: 'апреля',
    5: 'мая',
    6: 'июня',
    7: 'июля',
    8: 'августа',
    9: 'сентября',
    10: 'октября',
    11: 'ноября',
    12: 'декабря',
  };

  String day = dateTime.day.toString();
  String month = months[dateTime.month]!;
  String year = dateTime.year.toString();

  return '$day $month $year';
}

String formatDateMonthYear(DateTime dateTime) {
  final Map<int, String> months = {
    1: 'январь',
    2: 'февраль',
    3: 'март',
    4: 'апрель',
    5: 'май',
    6: 'июнь',
    7: 'июль',
    8: 'август',
    9: 'сентябрь',
    10: 'октябрь',
    11: 'ноябрь',
    12: 'декабрь',
  };

  String month = months[dateTime.month]!;
  String year = dateTime.year.toString();

  return '$month $year';
}

String formatDateShort(DateTime dateTime) {
  final Map<int, String> months = {
    1: 'янв.',
    2: 'фев.',
    3: 'мар.',
    4: 'апр.',
    5: 'мая',
    6: 'июня',
    7: 'июля',
    8: 'авг.',
    9: 'сент.',
    10: 'окт.',
    11: 'нояб.',
    12: 'дек.',
  };

  String day = dateTime.day.toString();
  String month = months[dateTime.month]!;
  String year = dateTime.year.toString();

  return '$day\n$month\n$year';
}

String formatDateForAlbum(DateTime dateTime) {
  final Map<int, String> weekDays = {
    DateTime.monday: 'Пн',
    DateTime.tuesday: 'Вт',
    DateTime.wednesday: 'Ср',
    DateTime.thursday: 'Чт',
    DateTime.friday: 'Пт',
    DateTime.saturday: 'Сб',
    DateTime.sunday: 'Вс',
  };

  final Map<int, String> months = {
    1: 'янв.',
    2: 'февр.',
    3: 'мар.',
    4: 'апр.',
    5: 'мая',
    6: 'июн.',
    7: 'июл.',
    8: 'авг.',
    9: 'сент.',
    10: 'окт.',
    11: 'нояб.',
    12: 'дек.',
  };

  String weekDay = weekDays[dateTime.weekday]!;
  String day = dateTime.day.toString();
  String month = months[dateTime.month]!;

  return '$weekDay, $day $month';
}

Future<void> launchAppUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

bool isValidEmail(String email) {
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  return emailRegExp.hasMatch(email);
}
