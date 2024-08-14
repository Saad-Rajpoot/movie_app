import 'package:flutter/material.dart';

class AppConstants {
  static const int connectTimeoutDuration = 5;
  static const int receiveTimeoutDuration = 5;
  static TextStyle? starTextStyle = const TextStyle(
      color: Color(0Xff9C9C9C), fontFamily: 'Mulish', fontSize: 12);

  static String formatDuration(DateTime dateTime, bool isDays) {
    DateTime pastDate = DateTime.parse(dateTime.toString());
    DateTime now = DateTime.now();
    Duration duration = now.difference(pastDate);
    int days = duration.inDays;
    int hours = duration.inHours;
    int minutes = duration.inMinutes % 60;
    if (isDays) {
      return '${days}d ${hours}h ${minutes}m';
    } else {
      return '${hours}h ${minutes}m';
    }
  }
}
