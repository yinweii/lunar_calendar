import 'package:intl/intl.dart';

class Utils {
  static String getNameDayOfWeek(DateTime date) {
    if (date.weekday == DateTime.monday) {
      return "Thứ 2";
    }
    if (date.weekday == DateTime.tuesday) {
      return "Thứ 3";
    }
    if (date.weekday == DateTime.wednesday) {
      return "Thứ 4";
    }
    if (date.weekday == DateTime.thursday) {
      return "Thứ 5";
    }
    if (date.weekday == DateTime.friday) {
      return "Thứ 6";
    }
    if (date.weekday == DateTime.saturday) {
      return "Thứ 7";
    }
    return "Chủ Nhật";
  }

  static String getSystemTime() {
    return DateFormat("HH:mm").format(DateTime.now());
  }
}
