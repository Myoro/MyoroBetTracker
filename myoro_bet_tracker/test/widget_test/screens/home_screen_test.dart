import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/blocs/available_income_cubit.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_bloc.dart';
import 'package:myoro_bet_tracker/widgets/app_bars/home_screen_app_bar.dart';
import 'package:myoro_bet_tracker/widgets/bodies/home_screen_body.dart';
import 'package:myoro_bet_tracker/widgets/screens/home_screen.dart';

import '../../base_test_widget.dart';
import '../../bet_model_constants.dart';

void main() {
  testWidgets('HomeScreen Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        widgetTestType: WidgetTestType.scaffold,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AvailableIncomeCubit(0)),
            BlocProvider(create: (context) => BetsBloc(List.generate(5, (_) => BetModelConstants.bet1))),
          ],
          child: const HomeScreen(),
        ),
      ),
    );

    expect(find.byType(HomeScreenAppBar), findsOneWidget);
    expect(find.byType(HomeScreenBody), findsOneWidget);
  });
}
