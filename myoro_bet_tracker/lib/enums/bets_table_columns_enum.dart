import 'package:myoro_bet_tracker/widgets/tables/bets_table.dart';
import 'package:myoro_bet_tracker/database.dart';

/// Enum to 'connect' [BetsTable]'s columns with [Database]'s attributes
enum BetsTableColumnsEnum {
  betName('Bet Name', 'name'),
  betType('Sport/Casino', 'sport'),
  moneyPlaced('\$ Placed', 'placed'),
  moneyGainedOrLost('\$ Gained or Lost', 'gained_or_lost'),
  datePlaced('Date Placed', 'date_placed');

  final String column;
  final String attribute;

  const BetsTableColumnsEnum(this.column, this.attribute);
}
