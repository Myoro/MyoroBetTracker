import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_event.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_state.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';

class BetsBloc extends Bloc<BetsEvent, BetsState> {
  BetsBloc(List<BetModel> bets) : super(BetsState(bets)) {
    on<AddBetEvent>((event, emit) {
      Database.insert('bets', event.bet.toJSON());
      emit(BetsState(state.bets..add(event.bet)));
    });

    on<EditBetEvent>((event, emit) {
      Database.update(
        'bets',
        event.newBet.toJSON(),
        event.oldBet.toJSON(),
      );

      final List<BetModel> newBetsList = List.from(state.bets);
      newBetsList[newBetsList.indexOf(event.oldBet)] = event.newBet;
      emit(BetsState(newBetsList));
    });

    on<DeleteBetEvent>((event, emit) {
      Database.delete('bets', event.bet.toJSON());

      final List<BetModel> newBetsList = List.from(state.bets);
      newBetsList.remove(event.bet);

      emit(BetsState(newBetsList));
    });
  }
}
