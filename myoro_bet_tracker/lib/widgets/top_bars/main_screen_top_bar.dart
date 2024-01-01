import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/dark_mode_cubit.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';

class MainScreenTopBar extends StatelessWidget implements PreferredSizeWidget {
  const MainScreenTopBar({ super.key });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
    title: Row(
      children: [
        const Text('MyoroBetTracker'),
        const Spacer(),
        ButtonWithoutFeedback(
          onTap: () => BlocProvider.of<DarkModeCubit>(context).toggle(),
          child: Icon(
            Icons.sunny,
            size: 40,
            color: Theme.of(context).colorScheme.onPrimary
          )
        )
      ]
    )
  );
}