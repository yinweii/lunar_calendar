import 'package:calender/utils/lunar_calender_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var now = DateTime.now();
  int timeZone = int.parse(now.timeZoneName);
  group('Test convert To Lunar', () {
    test('Solar To Lunar time now', () {
      // expect(
      //   convertSolar2Lunar(now.day, now.month, now.year, timeZone),
      //   equals([17, 5, 2022, 0]),
      // );
      expect(
        convertSolar2Lunar(30, 6, 2022, 7),
        equals([2, 6, 2022, 0]),
      );
      expect(
        convertSolar2Lunar(1, 1, 2022, 7),
        equals([29, 11, 2021, 0]),
      );
    });
    test('Solar To Lunar timezone +7', () {
      expect(
        convertSolar2Lunar(14, 6, 2022, 7),
        equals([16, 5, 2022, 0]),
      );
      expect(
        convertSolar2Lunar(30, 6, 2022, 7),
        equals([2, 6, 2022, 0]),
      );
      expect(
        convertSolar2Lunar(1, 1, 2022, 7),
        equals([29, 11, 2021, 0]),
      );
    });
  });
}
