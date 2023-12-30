import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:myoro_bet_tracker/bloc/dark_mode_cubit.dart";

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({ super.key });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Text("Simple Bet Tracker"),
          const Spacer(),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => BlocProvider.of<DarkModeCubit>(context).toggle(),
              child: const Icon(Icons.wb_sunny, size: 30)
            ),
          )
        ]
      )
    );
  }
}
