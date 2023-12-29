// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/bloc/betting_bloc.dart';
import 'package:myoro_bet_tracker/bloc/dark_mode_cubit.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';
import 'package:myoro_bet_tracker/screens/main_screen.dart';
import 'package:myoro_bet_tracker/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Database.init();
  final bool darkMode = (await Database.get('dark_mode'))['enabled'] == 1 ? true : false;
  final List<Map<String, Object?>> rows = await Database.select('bet');
  final List<BetModel> bets = [];
  for(final Map<String, Object?> row in rows) bets.add(BetModel.fromJson(row));

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DarkModeCubit(darkMode)),
        BlocProvider(create: (context) => BettingBloc(bets))
      ],
      child: const App()
    )
  );
}

class App extends StatelessWidget {
  const App({ super.key });

  @override
  Widget build(BuildContext context) => BlocBuilder<DarkModeCubit, bool>(
    builder: (context, darkMode) => MaterialApp(
      title: "MyoroBetTracker",
      theme: darkMode ? dark : light,
      home: const MainScreen()
    ),
  );
}