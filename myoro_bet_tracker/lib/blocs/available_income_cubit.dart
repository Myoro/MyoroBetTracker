import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/database.dart';

class AvailableIncomeCubit extends Cubit<double> {
  AvailableIncomeCubit(super.availableIncome);
  void setAvailableIncome(double income) {
    Database.update('available_income', { 'income': income.toStringAsFixed(2) });
    emit(income);
  }
}