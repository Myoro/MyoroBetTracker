// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_event.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_state.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';

class BetsBloc extends Bloc<BetsEvent, BetsState> {
  /// To calculate netGainOrLoss, totalMoneyPlacedOnBets, & winLossPercentage
  BetsState getBetAnalytics(List<BetModel> bets) {
    double netGainOrLossResult = 0;
    double totalMoneyPlacedOnBetsResult = 0;
    int betsWon = 0;
    int betsLost = 0;

    for (final BetModel bet in bets) {
      netGainOrLossResult += bet.gainedOrLost is double ? bet.gainedOrLost : 0;
      totalMoneyPlacedOnBetsResult += bet.placed;
      if (bet.gainedOrLost is double && bet.gainedOrLost > 0) {
        betsWon += 1;
      } else {
        betsLost += 1;
      }
    }

    return BetsState(
      bets: bets,
      netGainOrLoss: netGainOrLossResult,
      totalMoneyPlacedOnBets: totalMoneyPlacedOnBetsResult,
      winLossPercentage: (betsWon / (betsLost + betsWon)) * 100,
    );
  }

  BetsBloc(List<BetModel> bets) : super(BetsState(bets: bets)) {
    on<SetupAnalyticsEvent>((event, emit) => emit(getBetAnalytics(state.bets)));

    on<AddBetEvent>((event, emit) {
      Database.insert('bets', event.bet.toJSON());
      emit(getBetAnalytics(state.bets..add(event.bet)));
    });

    on<EditBetEvent>((event, emit) {
      Database.update(
        'bets',
        event.newBet.toJSON(),
        event.oldBet.toJSON(),
      );

      final List<BetModel> newBetsList = List.from(state.bets);
      newBetsList[newBetsList.indexOf(event.oldBet)] = event.newBet;
      emit(getBetAnalytics(newBetsList));
    });

    on<DeleteBetEvent>((event, emit) {
      Database.delete('bets', event.bet.toJSON());

      final List<BetModel> newBetsList = List.from(state.bets);
      newBetsList.remove(event.bet);

      emit(getBetAnalytics(newBetsList));
    });
  }
}
