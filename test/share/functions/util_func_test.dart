import 'package:demo_book_reader/share/functions/util_func.dart';
import 'package:test/test.dart';

void main() {
  group('limitCharacters function', () {
    test(
        'should return the joined list as string when its length is less than the limit',
        () {
      expect(limitCharacters(list: [1, 2, 3], limit: 10), equals('1, 2, 3'));
    });

    test(
        'should return the first element truncated with ellipsis when the list has only one element',
        () {
      expect(limitCharacters(list: ['abcdefg'], limit: 5), equals('abcde ...'));
    });

    test(
        'should return the first two elements joined with ellipsis when the list has two or three elements and their length is more than the limit',
        () {
      expect(
          limitCharacters(list: ['abc', 'def'], limit: 5), equals('abc, ...'));
      expect(limitCharacters(list: ['abc', 'def', 'ghi'], limit: 10),
          equals('abc, def, ...'));
    });

    test(
        'should return the first element and ellipsis when the list has more than three elements and their length is more than the limit',
        () {
      expect(limitCharacters(list: ['a', 'b', 'c', 'd'], limit: 3),
          equals('a, ...'));
    });
  });

  group('calculateUsagePercentage function', () {
    test(
        'should return the correct percentage when start date is in the past and end date is in the future',
        () {
      var startDate = DateTime.now().subtract(const Duration(days: 1));
      var endDate = DateTime.now().add(const Duration(days: 1));
      var usagePercentage = calculateUsagePercentage(startDate, endDate);
      expect(usagePercentage, inInclusiveRange(0.49, 0.51));
    });

    test('should return 0.0 when start date and end date are the same', () {
      var now = DateTime.now();
      var usagePercentage = calculateUsagePercentage(now, now);
      expect(usagePercentage, equals(0.0));
    });

    test(
        'should return 0.0 when start date is in the future and end date is in the future',
        () {
      var startDate = DateTime.now().add(const Duration(days: 1));
      var endDate = DateTime.now().add(const Duration(days: 2));
      var usagePercentage = calculateUsagePercentage(startDate, endDate);
      expect(usagePercentage, equals(0.0));
    });
  });

  group('parseDuration function', () {
    test('should return the correct duration for hours, minutes and seconds',
        () {
      expect(
          parseDuration('01:30:45.678'),
          equals(const Duration(
              hours: 1, minutes: 30, seconds: 45, microseconds: 678000)));
    });

    test(
        'should return the correct duration for days, hours, minutes and seconds',
        () {
      expect(
          parseDuration('3.10:45:20.123'),
          equals(const Duration(
              days: 3,
              hours: 10,
              minutes: 45,
              seconds: 20,
              microseconds: 123000)));
    });

    test('should return the correct duration for minutes and seconds', () {
      expect(
          parseDuration('10:20.567'),
          equals(
              const Duration(minutes: 10, seconds: 20, microseconds: 567000)));
    });

    test('should return the correct duration for seconds', () {
      expect(parseDuration('15.678'),
          equals(const Duration(seconds: 15, microseconds: 678000)));
    });
  });

  group('calculatePrice function', () {
    test('should return correct price for 100 and 20%', () {
      expect(calculatePrice(100, 20), equals(80.0));
    });

    test('should return correct price for 50 and 10%', () {
      expect(calculatePrice(50, 10), equals(45.0));
    });

    test('should return correct price for 200 and 50%', () {
      expect(calculatePrice(200, 50), equals(100.0));
    });

    test('should return correct price for 0 and 5%', () {
      expect(calculatePrice(0, 5), equals(0.0));
    });

    test('should return correct price for 100 and 0%', () {
      expect(calculatePrice(100, 0), equals(100.0));
    });
  });

  group('formatDateTime function', () {
    test('should format datetime correctly', () {
      expect(formatDateTime(DateTime(2023, 4, 26)), equals('26/04/2023'));
    });
  });
}
