import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/enums/gained_or_lost_enum.dart';

void main() {
  test('GainedOrLostEnum Unit Test', () {
    expect(GainedOrLostEnum.gained.result, 'Gained');
    expect(GainedOrLostEnum.lost.result, 'Lost');
  });
}