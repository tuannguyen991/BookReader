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
  int total = endDate.difference(startDate).inMilliseconds;
  int used = DateTime.now().difference(startDate).inMilliseconds;
  return (used / total);
}
