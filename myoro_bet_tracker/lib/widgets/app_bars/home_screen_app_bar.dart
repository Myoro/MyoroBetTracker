import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/dark_mode_cubit.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';
import 'package:myoro_bet_tracker/widgets/screens/home_screen.dart';

/// [AppBar] for [HomeScreen]
class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AppBar(
      title: Row(
        children: [
          Text(
            'MyoroBetTracker',
            style: theme.textTheme.titleLarge,
          ),
          const Spacer(),
          ButtonWithoutFeedback(
            onTap: () {}, // TODO: Modal
            child: Icon(
              Icons.add,
              size: 35,
              color: theme.colorScheme.onPrimary,
            ),
          ),
          const SizedBox(width: 5),
          ButtonWithoutFeedback(
            onTap: () => BlocProvider.of<DarkModeCubit>(context).toggle(),
            child: Icon(
              Icons.sunny,
              size: 30,
              color: theme.colorScheme.onPrimary,
            ),
          )
        ],
      ),
    );
  }
}
