import 'package:myoro_bet_tracker/models/bet_model.dart';

class BetModelConstants {
  static BetModel get betModel => BetModel(
    name: 'BetModel Constant',
    sport: 'Soccer',
    placed: 1234.56,
    gainedOrLost: 78.90,
    datePlaced: DateTime.now()
  );
}