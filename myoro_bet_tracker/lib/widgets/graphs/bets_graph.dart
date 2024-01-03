import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/enums/bet_type_enum.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';
import 'package:myoro_bet_tracker/widgets/headers/header_with_checkbox.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_dropdown.dart';

class BetsGraph extends StatefulWidget {
  const BetsGraph({ super.key });

  @override
  State<BetsGraph> createState() => _BetsGraphState();
}

class _BetsGraphState extends State<BetsGraph> {
  final ValueNotifier<BetTypeEnum> _filter = ValueNotifier<BetTypeEnum>(BetTypeEnum.allBets);
  final ValueNotifier<bool> _showChart = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    Database.get('show').then((row) => _showChart.value = row['show_performance_chart'] == 1 ? true : false);
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: _filter,
    builder: (context, filter, child) => BlocBuilder<BetsBloc, BetsState>(
      builder: (context, state) {
        final List<FlSpot> coords = [];
        double maxX = 0, maxY = 0, minY = 0;
        for(final BetModel bet in state.bets) {
          if(filter == BetTypeEnum.allBets || filter.value == bet.sport) {
            final double index = state.bets.indexOf(bet).toDouble();
            final double gainedOrLost = bet.gainedOrLost == 'Lost' ? -bet.placed : bet.gainedOrLost;
      
            if(index > maxX) maxX = index;
            if(gainedOrLost > maxY) maxY = gainedOrLost;
            if(gainedOrLost < minY) minY = gainedOrLost;
      
            coords.add(FlSpot(
              bet.gainedOrLost == 'Lost' ? -bet.placed : bet.gainedOrLost,
              double.parse(state.bets.indexOf(bet).toString())
            ));
          }
        }
    
        return ValueListenableBuilder(
          valueListenable: _showChart,
          builder: (context, showChart, child) => Column(
            children: [
              HeaderWithCheckbox(
                title: 'Performance Chart',
                onChanged: (checked) {
                  _showChart.value = checked;
                  Database.update('show', { 'show_performance_chart': checked ? 1 : 0 });
                }
              ),
              if(showChart) ...[
                const SizedBox(height: 10),
                SizedBox(
                  height: 300,
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: false),
                      titlesData: FlTitlesData(
                        show: true,
                        leftTitles: AxisTitles(
                          axisNameWidget: Row(
                            children: [
                              const SizedBox(width: 30),
                              Text(minY.toStringAsFixed(0), style: Theme.of(context).textTheme.bodySmall),
                              const Spacer(),
                              Text(
                                'Gained/Lost',
                                style: Theme.of(context).textTheme.bodySmall
                              ),
                              const Spacer(),
                              Text(maxY.toStringAsFixed(0), style: Theme.of(context).textTheme.bodySmall)
                            ]
                          ),
                          axisNameSize: 50
                        ),
                        bottomTitles: AxisTitles(
                          axisNameWidget: Row(
                            children: [
                              const SizedBox(width: 30),
                              Text('0', style: Theme.of(context).textTheme.bodySmall),
                              const Spacer(),
                              Text(
                                'Sport',
                                style: Theme.of(context).textTheme.bodySmall
                              ),
                              const Spacer(),
                              Text(maxX.toStringAsFixed(0), style: Theme.of(context).textTheme.bodySmall)
                            ]
                          ),
                          axisNameSize: 40,
                        ),
                        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false))
                      ),
                      minX: 0,
                      maxX: maxX,
                      minY: minY,
                      maxY: maxY,
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: coords,
                          isCurved: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                          barWidth: 5,
                          color: Theme.of(context).colorScheme.onPrimary
                        )
                      ]
                    )
                  )
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: BasicDropdown(
                        items: const [
                          'All Bets',
                          'Soccer',
                          'Basketball',
                          'Hockey',
                          'Casino'
                        ],
                        onChanged: (value) {
                          switch(value) {
                            case 'All Bets':   _filter.value = BetTypeEnum.allBets;    break;
                            case 'Soccer':     _filter.value = BetTypeEnum.soccer;     break;
                            case 'Basketball': _filter.value = BetTypeEnum.basketball; break;
                            case 'Hockey':     _filter.value = BetTypeEnum.hockey;     break;
                            case 'Casino':     _filter.value = BetTypeEnum.casino;     break;
                          }
                        }
                      ),
                    ),
                  ],
                )
              ]
            ]
          )
        );
      }
    ),
  );
}