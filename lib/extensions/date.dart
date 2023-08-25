extension DateTimeExtensions on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isYesterday(DateTime other) {
    DateTime yesterday = subtract(const Duration(days: 1));
    return yesterday.isSameDate(other);
  }
}
