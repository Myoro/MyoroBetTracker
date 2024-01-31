import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/input_formatters/date_formatter.dart';
import 'package:myoro_bet_tracker/widgets/buttons/text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/cards/base_card.dart';
import 'package:myoro_bet_tracker/widgets/bodies/home_screen_body.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_text_field_form.dart';

/// Summary calculations of the user's bets
/// 
/// Used in [HomeScreenBody]
class BetSummaryCard extends StatelessWidget {
  const BetSummaryCard({ super.key });

  @override
  Widget build(BuildContext context) => const BaseCard(
    title: 'Summary & Analytics',
    content: Column(
      children: [
        // TODO
        _Filter(),
        SizedBox(height: 20),
        _FormOutputs(),
      ],
    ),
  );
}

class _FormOutput extends StatelessWidget {
  final String title;
  final String data;
  final double? width;

  const _FormOutput({
    required this.title,
    required this.data,
    this.width,
  });

  @override
  Widget build(BuildContext context) => BaseCard(
    title: title,
    width: width,
    expanded: true,
    content: Text(
      data,
      style: Theme.of(context).textTheme.bodyMedium,
    ),
  );
}

class _FormOutputs extends StatelessWidget {
  const _FormOutputs();

  @override
  Widget build(BuildContext context) => const Row(
    children: [
      // TODO
      _FormOutput(title: 'Net Gain / Loss', data: '\$1234.56', width: 160),
      SizedBox(width: 10),
      // TODO
      _FormOutput(title: 'Total \$ Placed on Bets', data: '\$10000.00'),
      SizedBox(width: 10),
      // TODO
      _FormOutput(title: 'Win / Loss', data: '50%', width: 160),
    ],
  );
}

class _Filter extends StatefulWidget {
  const _Filter();

  @override
  State<_Filter> createState() => _FilterState();
}

class _FilterState extends State<_Filter> {
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  @override
  void dispose() {
    _fromDateController.dispose();
    _toDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Row(
    children: [
      BaseCard(
        title: 'Recent Information',
        expanded: true,
        height: 153,
        content: Wrap(
          spacing: 10,
          children: [
            // TODO
            TextHoverButton(onTap: () {}, text: '1D'),
            // TODO
            TextHoverButton(onTap: () {}, text: '1M'),
            // TODO
            TextHoverButton(onTap: () {}, text: '1Y'),
          ],
        ),
      ),
      const SizedBox(width: 10),
      BaseCard(
        title: 'Specific Date Lookup',
        expanded: true,
        content: Wrap(
          children: [
            // TODO
            BasicTextFieldForm(
              title: 'From',
              controller: _fromDateController,
              formatters: [DateFormatter()],
            ),
            // TODO
            const SizedBox(width: 10),
            BasicTextFieldForm(
              title: 'From DD/MM/YYYY',
              controller: _toDateController,
              formatters: [DateFormatter()],
            ),
          ],
        ),
      ),
    ],
  );
}