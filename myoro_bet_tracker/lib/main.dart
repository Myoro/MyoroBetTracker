import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_bloc.dart';
import 'package:myoro_bet_tracker/blocs/dark_mode_cubit.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';
import 'package:myoro_bet_tracker/themes.dart';
import 'package:myoro_bet_tracker/widgets/screens/home_screen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  windowManager.ensureInitialized();

  windowManager.setMinimumSize(const Size(1100, 400));

  await Database.init();
  final bool isDarkMode = (await Database.get('dark_mode'))['enabled'] == 1 ? true : false;
  final List<BetModel> bets = (await Database.select('bets')).map((json) => BetModel.fromJSON(json)).toList();

  runApp(MultiBlocProvider(
    // Since this is a small project, we use a global bloc provider structure
    providers: [
      BlocProvider(create: (context) => DarkModeCubit(isDarkMode)),
      BlocProvider(create: (context) => BetsBloc(bets)),
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
            theme: createTheme(isDarkMode),
            home: const HomeScreen(),
          ));
}
