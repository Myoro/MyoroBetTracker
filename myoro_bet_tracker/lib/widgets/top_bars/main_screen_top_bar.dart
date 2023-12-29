import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/bloc/dark_mode_cubit.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_button_without_feedback.dart';

class MainScreenTopBar extends StatelessWidget implements PreferredSizeWidget {
  const MainScreenTopBar({ super.key });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
    title: Row(
      children: [
        Text('MyoroBetTracker', style: Theme.of(context).textTheme.displayLarge),
        const Spacer(),
        IconButtonWithoutFeedback(
          onTap: () => BlocProvider.of<DarkModeCubit>(context).toggle(),
          icon: Icons.sunny,
          size: 50
        )
      ]
    )
  );
}