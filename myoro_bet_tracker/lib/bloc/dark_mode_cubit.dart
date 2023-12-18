import 'package:flutter_bloc/flutter_bloc.dart';

class DarkModeCubit extends Cubit<bool> {
  final bool enabled;
  DarkModeCubit(this.enabled) : super(enabled);
  void toggle() => emit(!enabled);
}