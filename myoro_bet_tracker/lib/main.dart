import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:myoro_bet_tracker/bloc/dark_mode_cubit.dart";
import "package:myoro_bet_tracker/database.dart";
import "package:myoro_bet_tracker/screen.dart";
import "package:myoro_bet_tracker/themes.dart";

void main() async {
  if(kDebugMode) await Database().resetDatabase();
  await Database().init();

  final Map<String, Object?> row = await Database().get("dark_mode");
  final bool darkModeEnabled = (row["enabled"] == 1) ? true : false;

  runApp(
    BlocProvider(
      create: (context) => DarkModeCubit(darkModeEnabled),
      child: const App()
    )
  );
}

class App extends StatelessWidget {
  const App({ super.key });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, bool>(
      builder: (context, enabled) => MaterialApp(
        title: "Simple Bet Tracker",
        theme: enabled ? dark : light,
        home: Screen()
      )
    );
  }
}