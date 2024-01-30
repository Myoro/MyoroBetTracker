import 'package:myoro_bet_tracker/models/bet_model.dart';

abstract class BetsEvent {}

class AddBetEvent extends BetsEvent {
  final BetModel bet;
  AddBetEvent(this.bet);
}
