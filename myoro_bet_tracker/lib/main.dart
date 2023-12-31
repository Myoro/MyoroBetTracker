// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc.dart';
import 'package:myoro_bet_tracker/blocs/dark_mode_cubit.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';
import 'package:myoro_bet_tracker/screens/main_screen.dart';
import 'package:myoro_bet_tracker/themes.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if(!Platform.isIOS && !Platform.isAndroid) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(const Size(400, 400));
  }

  await Database.init();
  if(kDebugMode) await Database.reset(); // Resets everything to assert that tables are made correctly
  final bool isDarkMode = (await Database.get('dark_mode'))['enabled'] == 1 ? true : false;
  final String availableIncome = (await Database.get('available_income'))['income'] as String;
  final List<Map<String, Object?>> bets = await Database.select('bets');
  final List<BetModel> betsFormatted = [];
  for(final Map<String, Object?> bet in bets) betsFormatted.add(BetModel.fromJSON(bet));

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DarkModeCubit(isDarkMode)),
        BlocProvider(create: (context) => BetsBloc(double.parse(availableIncome)))
      ],
      child: const App()
    )
  );
}

class App extends StatelessWidget {
  const App({ super.key });

  @override
  Widget build(BuildContext context) => BlocBuilder<DarkModeCubit, bool>(
    builder: (context, isDarkMode) => MaterialApp(
      title: 'MyoroBetTracker',
      theme: isDarkMode ? dark : light,
      home: const MainScreen()
    ),
  );
}