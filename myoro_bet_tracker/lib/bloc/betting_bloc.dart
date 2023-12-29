import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';

abstract class BettingEvent {}
class AddBet extends BettingEvent {}
class DeleteBetEvent extends BettingEvent {
  final int id;
  final int index;
  DeleteBetEvent(this.id, this.index);
}

class BettingState {
  final List<BetModel> bets;
  final int? selectedBet;

  BettingState(this.bets, this.selectedBet);

  BettingState copyWith({
    List<BetModel>? bets,
    int? selectedBet
  }) => BettingState(
    bets ?? this.bets,
    selectedBet ?? this.selectedBet
  );
}

class BettingBloc extends Bloc<BettingEvent, BettingState> {
  BettingBloc(List<BetModel> bets) : super(BettingState(bets, null)) {
    on<AddBet>((event, emit) {
      Database.insert('bet', { 'placed': 0, 'won': 0 });
      emit(state.copyWith(
        bets: state.bets..add(BetModel(id: state.bets.length, placed: 0, won: 0)),
        selectedBet: state.bets.length - 1
      ));
    });

    on<DeleteBetEvent>((event, emit) {
      Database.delete('bet', where: 'id = ?', whereArgs: [event.id]);
      emit(state.copyWith(bets: state.bets..removeAt(event.index), selectedBet: null));
    });
  }
}