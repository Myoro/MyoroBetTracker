import "package:flutter_bloc/flutter_bloc.dart";

class DarkModeCubit extends Cubit<bool> {
  DarkModeCubit(enabled) : super(enabled);
  void toggle() => emit(!state);
}