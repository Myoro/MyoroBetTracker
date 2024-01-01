import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';

abstract class BetsEvent {}
class AddBetEvent extends BetsEvent {}

class BetsState {
  final List<BetModel> bets;

  BetsState({ this.bets = const [] });
}

class BetsBloc extends Bloc<BetsEvent, BetsState> {
  BetsBloc() : super(BetsState()) {
    on<AddBetEvent>((event, emit) => print('TODO')); // TODO
  }
}