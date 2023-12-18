// ignore_for_file: curly_braces_in_flow_control_structures

import "package:flutter_bloc/flutter_bloc.dart";
import "package:myoro_bet_tracker/database.dart";

class BetCubit extends Cubit<List<Map<String, dynamic>>> {
  BetCubit(List<Map<String, dynamic>> bets) : super(bets);

  void addBet() {
    final List<Map<String, dynamic>> newList = state.toList();
    Map<String, dynamic> bet = { "placed": "0", "gained": "0", "bet_won": 1 };
    newList.add(bet);
    Database().insert("bets", bet);
    emit(newList);
  }

  void editBet(int index, String key, dynamic data) {
    final List<Map<String, dynamic>> newList = state.toList();
    newList[index][key] = data;
    Database().update("bets", key, newList[index][key], { "id": index });
    emit(newList);
  }

  void deleteBet(int index) {
    final List<Map<String, dynamic>> newList = state.toList();
    newList.removeAt(index);
    Database().delete("bets", index);
    emit(newList);
  }
}