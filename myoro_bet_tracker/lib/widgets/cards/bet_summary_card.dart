import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_state.dart';
import 'package:myoro_bet_tracker/widgets/cards/base_card.dart';
import 'package:myoro_bet_tracker/widgets/bodies/home_screen_body.dart';

/// Summary calculations of the user's bets
/// 
/// Used in [HomeScreenBody]
class BetSummaryCard extends StatelessWidget {
  const BetSummaryCard({ super.key });

  @override
  Widget build(BuildContext context) => BlocBuilder<BetsBloc, BetsState>(
    builder: (context, state) => Column(
      children: [
        _FormOutput(
          title: 'Net Gain / Loss',
          data: '\$${state.netGainOrLoss.toStringAsFixed(2)}',
        ),
        const SizedBox(height: 10),
        _FormOutput(
          title: 'Total \$ Placed on Bets',
          data: '\$${state.totalMoneyPlacedOnBets.toStringAsFixed(2)}',
        ),
        const SizedBox(height: 10),
        _FormOutput(
          title: 'Win / Loss',
          data: '${state.winLossPercentage.toStringAsFixed(2)}%',
        ),
      ],
    ),
  );
}

class _FormOutput extends StatelessWidget {
  final String title;
  final String data;

  const _FormOutput({ required this.title, required this.data });

  @override
  Widget build(BuildContext context) => BaseCard(
    title: title,
    width: double.infinity,
    content: Text(
      data,
      style: Theme.of(context).textTheme.bodyMedium,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  );
}