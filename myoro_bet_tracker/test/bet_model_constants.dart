import 'package:intl/intl.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';

class BetModelConstants {
  static BetModel get bet1 => BetModel(
        name: 'BetModel Constant #1',
        sport: 'Soccer',
        placed: 123.45,
        gainedOrLost: 678.90,
        datePlaced: DateFormat('dd/MM/yyyy').format(DateTime.now()),
      );

  static BetModel get bet2 => BetModel(
        name: 'BetModel Constant #2',
        sport: 'Hockey',
        placed: 123.45,
        gainedOrLost: -678.90,
        datePlaced: DateFormat('dd/MM/yyyy').format(DateTime.now()),
      );

  static Map<String, Object?> get bet1ConditionsFormatted => {
        'where': 'name = ? AND sport = ? AND placed = ? AND gained_or_lost = ? AND date_placed = ?',
        'where_args': [
          'BetModel Constant #1',
          'Soccer',
          '123.45',
          '678.90',
          DateFormat('dd/MM/yyyy').format(DateTime.now()),
        ],
      };

  static Map<String, Object?> get bet2ConditionsFormatted => {
        'where': 'name = ? AND sport = ? AND placed = ? AND gained_or_lost = ? AND date_placed = ?',
        'where_args': [
          'BetModel Constant #2',
          'Hockey',
          '123.45',
          '-678.90',
          DateFormat('dd/MM/yyyy').format(DateTime.now()),
        ],
      };
}
