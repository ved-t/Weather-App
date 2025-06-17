import 'package:intl/intl.dart';

class TimeConverter{
  static String fromEpochSeconds(int epochSeconds) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(epochSeconds * 1000);
    return DateFormat.jm().format(dateTime); // 'jm' = 10:45 AM
  }
}