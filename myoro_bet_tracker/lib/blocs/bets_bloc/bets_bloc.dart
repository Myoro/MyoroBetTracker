import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_event.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_state.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';

class BetsBloc extends Bloc<BetsEvent, BetsState> {
  BetsBloc(List<BetModel> bets) : super(BetsState(bets)) {
    on<AddBetEvent>((event, emit) {
      Database.insert('bets', event.bet.toJSON());
      emit(BetsState(bets..add(event.bet)));
    });
  }
}
