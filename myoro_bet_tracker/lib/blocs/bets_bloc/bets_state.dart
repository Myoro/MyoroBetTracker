import 'package:myoro_bet_tracker/models/bet_model.dart';

class BetsState {
  final List<BetModel> bets;
  final double netGainOrLoss;
  final double totalMoneyPlacedOnBets;
  final double winLossPercentage;

  BetsState({
    required this.bets,
    this.netGainOrLoss = 0,
    this.totalMoneyPlacedOnBets = 0,
    this.winLossPercentage = 0,
  });

  BetsState copyWith({
    List<BetModel>? bets,
    double? netGainOrLoss,
    double? totalMoneyPlacedOnBets,
    double? winLossPercentage,
  }) =>
      BetsState(
        bets: bets ?? this.bets,
        netGainOrLoss: netGainOrLoss ?? this.netGainOrLoss,
        totalMoneyPlacedOnBets: totalMoneyPlacedOnBets ?? this.totalMoneyPlacedOnBets,
        winLossPercentage: winLossPercentage ?? this.winLossPercentage,
      );
}
