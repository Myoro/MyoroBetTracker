import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/enums/type_of_bet_enum.dart';

void main() {
  test('TypeOfBetEnum Unit Test', () {
    expect(TypeOfBetEnum.soccer.type, 'Soccer');
    expect(TypeOfBetEnum.basketball.type, 'Basketball');
    expect(TypeOfBetEnum.hockey.type, 'Hockey');
    expect(TypeOfBetEnum.tennis.type, 'Tennis');
    expect(TypeOfBetEnum.casino.type, 'Casino');
  });
}
