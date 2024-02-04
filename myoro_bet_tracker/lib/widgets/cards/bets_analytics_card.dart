import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/available_income_cubit.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_state.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';
import 'package:myoro_bet_tracker/widgets/cards/base_card.dart';
import 'package:myoro_bet_tracker/widgets/outputs/form_output.dart';

class BetsAnalyticsCard extends StatelessWidget {
  const BetsAnalyticsCard({super.key});

  @override
  Widget build(BuildContext context) => const BaseCard(
        title: 'Bets Analytics',
        content: Column(
          children: [
            _AvailableIncome(),
            SizedBox(height: 10),
            _BetsSummary(),
          ],
        ),
      );
}

class _AvailableIncome extends StatefulWidget {
  const _AvailableIncome();

  @override
  State<_AvailableIncome> createState() => _AvailableIncomeState();
}

class _AvailableIncomeState extends State<_AvailableIncome> {
  final ValueNotifier<IconData> _incomeVisibleIcon = ValueNotifier<IconData>(Icons.visibility);

  @override
  void dispose() {
    _incomeVisibleIcon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<AvailableIncomeCubit, double>(
      builder: (context, availableIncome) => ValueListenableBuilder(
        valueListenable: _incomeVisibleIcon,
        builder: (context, icon, child) => Column(
          children: [
            Text('Available Income', style: theme.textTheme.titleMedium),
            const SizedBox(height: 5),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  icon == Icons.visibility_off ? '\$${availableIncome.toStringAsFixed(2)}' : '*' * (availableIncome.toStringAsFixed(2).length + 1),
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(width: 5),
                ButtonWithoutFeedback(
                  onTap: () => _incomeVisibleIcon.value = _incomeVisibleIcon.value == Icons.visibility ? Icons.visibility_off : Icons.visibility,
                  child: Icon(
                    icon,
                    size: 30,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BetsSummary extends StatelessWidget {
  const _BetsSummary();

  @override
  Widget build(BuildContext context) => BlocBuilder<BetsBloc, BetsState>(
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FormOutput(
              title: 'Net Gained or Lost',
              information: '\$${state.netGainOrLoss.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 10),
            FormOutput(
              title: 'Total Money Placed on Bets',
              information: '\$${state.totalMoneyPlacedOnBets.toStringAsFixed(2)}',
            ),
            if (state.winLossPercentage > 0) ...[
              const SizedBox(height: 10),
              FormOutput(
                title: 'Win / Loss Percentage',
                information: '%${state.winLossPercentage.toStringAsFixed(2)}',
              ),
            ],
          ],
        ),
      );
}
