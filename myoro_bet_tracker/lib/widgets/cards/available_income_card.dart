import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/available_income_cubit.dart';
import 'package:myoro_bet_tracker/widgets/bodies/home_screen_body.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';
import 'package:myoro_bet_tracker/widgets/cards/base_card.dart';

/// Hides the available income by default, by clicking on the eye, shows the income to the user
/// 
/// Used in [HomeScreenBody]
class AvailableIncomeCard extends StatefulWidget {
  const AvailableIncomeCard({ super.key });

  @override
  State<AvailableIncomeCard> createState() => _AvailableIncomeCardState();
}

class _AvailableIncomeCardState extends State<AvailableIncomeCard> {
  final ValueNotifier<IconData> _showIncomeButtonIcon = ValueNotifier<IconData>(Icons.visibility_off);

  @override
  void dispose() {
    _showIncomeButtonIcon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<AvailableIncomeCubit, double>(
      builder: (context, availableIncome) => ValueListenableBuilder(
        valueListenable: _showIncomeButtonIcon,
        builder: (context, icon, child) => BaseCard(
          title: 'Income',
          content: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                icon == Icons.visibility
                  ? availableIncome.toStringAsFixed(2)
                  : '*' * availableIncome.toStringAsFixed(2).length,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(width: 10),
              ButtonWithoutFeedback(
                onTap: () => _showIncomeButtonIcon.value = icon == Icons.visibility ? Icons.visibility_off : Icons.visibility,
                child: Icon(
                  icon,
                  size: 28,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}