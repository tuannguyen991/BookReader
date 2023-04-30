import 'package:intl/intl.dart';

String limitCharacters({required List<dynamic> list, required int limit}) {
  if (list.join(',').length <= limit) {
    return list.join(', ');
  } else {
    if (list.length == 1) {
      return '${list.first.toString().substring(0, limit)} ...';
    } else if (list.length == 2) {
      return '${list.first.toString()}, ...';
    } else if (list.getRange(0, 2).toList().join(', ').length < limit) {
      return '${list.getRange(0, 2).toList().join(', ')}, ...';
    } else {
      return '${list.first.toString()}, ...';
    }
  }
}

double calculateUsagePercentage(DateTime startDate, DateTime endDate) {
  if (startDate.compareTo(endDate) == 0 ||
      (startDate.compareTo(DateTime.now()) > 0)) {
    return 0;
  }
  int total = endDate.difference(startDate).inMilliseconds;
  int used = DateTime.now().difference(startDate).inMilliseconds;
  return (used / total);
}

Duration parseDuration(String s) {
  int days = 0;
  int hours = 0;
  int minutes = 0;
  int micros;
  List<String> parts = s.split(':');
  if (parts.length > 2) {
    String dayHour = parts[parts.length - 3];
    List<String> newParts = dayHour.split('.');
    if (newParts.length > 1) {
      days = int.parse(newParts[0]);
      hours = int.parse(newParts[1]);
    } else {
      hours = int.parse(parts[parts.length - 3]);
    }
  }
  if (parts.length > 1) {
    minutes = int.parse(parts[parts.length - 2]);
  }
  micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
  return Duration(
      days: days, hours: hours, minutes: minutes, microseconds: micros);
}

double calculatePrice(int price, int discountPercentage) =>
    (price / 100 * (100 - discountPercentage));

String formatDateTime(DateTime input) => DateFormat('dd/MM/yyyy').format(input);
