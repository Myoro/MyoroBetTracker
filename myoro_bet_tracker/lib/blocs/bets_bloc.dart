import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';

abstract class BetsEvent {}
class AddBetEvent extends BetsEvent {}

class BetsState {
  final List<BetModel> bets;

  BetsState({ this.bets = const [] });

  BetsState copyWith({
    List<BetModel>? bets,
    int? editing
  }) => BetsState(
    bets: bets ?? this.bets,
  );
}

class BetsBloc extends Bloc<BetsEvent, BetsState> {
  BetsBloc() : super(BetsState()) {
    on<AddBetEvent>((event, emit) {
      // TODO: Insert in database
      emit(state.copyWith(bets: [ ...state.bets, BetModel(placed: 0, gainedOrLost: 0) ],));
    });
  }
}