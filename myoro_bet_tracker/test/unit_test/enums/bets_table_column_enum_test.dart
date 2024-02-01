import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/enums/bets_table_columns_enum.dart';

void main() {
  test('BetsTableColumnEnum Unit Test', () {
    expect(BetsTableColumnsEnum.values.length, 5);
    expect(BetsTableColumnsEnum.betName.column, 'Bet Name');
    expect(BetsTableColumnsEnum.betName.attribute, 'name');
    expect(BetsTableColumnsEnum.betType.column, 'Sport/Casino');
    expect(BetsTableColumnsEnum.betType.attribute, 'sport');
    expect(BetsTableColumnsEnum.moneyPlaced.column, '\$ Placed');
    expect(BetsTableColumnsEnum.moneyPlaced.attribute, 'placed');
    expect(BetsTableColumnsEnum.moneyGainedOrLost.column, '\$ Gained or Lost');
    expect(BetsTableColumnsEnum.moneyGainedOrLost.attribute, 'gained_or_lost');
    expect(BetsTableColumnsEnum.datePlaced.column, 'Date Placed');
    expect(BetsTableColumnsEnum.datePlaced.attribute, 'date_placed');
  });
}