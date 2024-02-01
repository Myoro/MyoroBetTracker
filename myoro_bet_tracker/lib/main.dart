import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/available_income_cubit.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_event.dart';
import 'package:myoro_bet_tracker/blocs/dark_mode_cubit.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';
import 'package:myoro_bet_tracker/themes.dart';
import 'package:myoro_bet_tracker/widgets/screens/home_screen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if(!Platform.isIOS && !Platform.isAndroid) {
    windowManager.ensureInitialized();
    windowManager.setMinimumSize(const Size(500, 500));
  }

  await Database.init();
  final bool isDarkMode = (await Database.get('dark_mode'))['enabled'] == 1 ? true : false;
  final List<BetModel> bets = (await Database.select('bets')).map((json) => BetModel.fromJSON(json)).toList();
  final double availableIncome = double.parse(double.parse((await Database.get('available_income'))['income'] as String).toStringAsFixed(2));

  runApp(MultiBlocProvider(
    // Since this is a small project, we use a global bloc provider structure
    providers: [
      BlocProvider(create: (context) => DarkModeCubit(isDarkMode)),
      BlocProvider(create: (context) => BetsBloc(bets)..add(SetupAnalyticsEvent())),
      BlocProvider(create: (context) => AvailableIncomeCubit(availableIncome)),
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<DarkModeCubit, bool>(
      builder: (context, isDarkMode) => MaterialApp(
            title: 'Myoro Bet Tracker',
            theme: createTheme(false),
            darkTheme: createTheme(true),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const HomeScreen(),
          ));
}
