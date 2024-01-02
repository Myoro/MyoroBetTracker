// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';

abstract class BetsEvent {}
class AddBetEvent extends BetsEvent {
  final BetModel bet;
  AddBetEvent(this.bet);
}
class FilterBetsEvent extends BetsEvent {
  final String column;
  FilterBetsEvent(this.column);
}
class AddAvailableIncomeEvent extends BetsEvent {
  final double income;
  AddAvailableIncomeEvent(this.income);
}

class BetsState {
  final List<BetModel> bets;
  final String tableCategory;
  final double? availableIncome;

  BetsState({
    this.bets = const [],
    this.tableCategory = 'All',
    this.availableIncome
  });

  BetsState copyWith({
    List<BetModel>? bets,
    String? tableCategory,
    double? availableIncome
  }) => BetsState(
    bets: bets ?? this.bets,
    tableCategory: tableCategory ?? this.tableCategory,
    availableIncome: availableIncome ?? this.availableIncome
  );
}

class BetsBloc extends Bloc<BetsEvent, BetsState> {
  BetsBloc(double availableIncome) : super(BetsState(availableIncome: availableIncome)) {
    on<AddBetEvent>((event, emit) {
      Database.insert('bets', event.bet.toJSON());
      emit(state.copyWith(bets: [ ...state.bets, event.bet ]));
    });

    on<FilterBetsEvent>((event, emit) {
      final List<BetModel> newBets = [];

      switch(event.column) {
        case 'Name':
          state.bets.sort((a, b) => a.name!.compareTo(b.name!));
          emit(state.copyWith(bets: state.bets));
          break;
        case 'Sport':
          // Soccer, Basketball, Hockey, Casino
          for(int i = 0; i < 4; i++) {
            late final String sport;

            switch(i) {
              case 0:
                sport = 'Soccer';
                break;
              case 1:
                sport = 'Basketball';
                break;
              case 2:
                sport = 'Hockey';
                break;
              case 3:
                sport = 'Casino';
                break;
            }

            for(final BetModel bet in state.bets)
              if(bet.sport == sport)
                newBets.add(bet);
          }
          emit(state.copyWith(bets: newBets));
          break;
        case '\$ Placed':
          state.bets.sort((a, b) => a.placed.compareTo(b.placed));
          emit(state.copyWith(bets: state.bets));
          break;
        case '\$ Gained/Lost':
          state.bets.sort((a, b) => a.gainedOrLost.compareTo(b.gainedOrLost));
          emit(state.copyWith(bets: state.bets));
          break;
        case 'Date Placed':
          state.bets.sort((a, b) => a.datePlaced!.compareTo(b.datePlaced!));
          emit(state.copyWith(bets: state.bets));
          break;
      }
    });

    on<AddAvailableIncomeEvent>((event, emit) {
      Database.update('available_income', { 'income': event.income.toStringAsFixed(2) });
      emit(state.copyWith(availableIncome: event.income));
    });
  }
}