import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc.dart';
import 'package:myoro_bet_tracker/blocs/dark_mode_cubit.dart';
import 'package:myoro_bet_tracker/themes.dart';

class BaseTestWidget extends StatelessWidget {
  final String title;
  final bool screenTest;
  final bool topBarTest;
  final Widget child;

  const BaseTestWidget({
    super.key,
    required this.title,
    this.topBarTest = false,
    this.screenTest = false,
    required this.child
  });

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => DarkModeCubit(true)),
      BlocProvider(create: (context) => BetsBloc(0))
    ],
    child: BlocBuilder<DarkModeCubit, bool>(
      builder: (context, isDarkMode) => MaterialApp(
        title: title,
        theme: isDarkMode ? dark : light,
        home: screenTest ? child : Scaffold(
          body: child // edit this to accept top bars
        )
      ),
    ),
  );
}