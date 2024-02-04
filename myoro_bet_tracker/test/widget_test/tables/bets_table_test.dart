import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_bloc.dart';
import 'package:myoro_bet_tracker/widgets/tables/bets_table.dart';

import '../../base_test_widget.dart';
import '../../bet_model_constants.dart';

void main() {
  testWidgets('BetsTable Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: BlocProvider(
          create: (context) => BetsBloc(List.generate(5, (_) => BetModelConstants.bet1)),
          child: const BetsTable(),
        ),
      ),
    );

    expect(find.byType(Table), findsOneWidget);
  });
}
