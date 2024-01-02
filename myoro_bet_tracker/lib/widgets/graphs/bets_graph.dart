import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_dropdown.dart';

class BetsGraph extends StatelessWidget {
  const BetsGraph({ super.key });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text('Performace Chart', style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 10),
      SizedBox(
        height: 300,
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: FlTitlesData(
              show: true,
              leftTitles: AxisTitles(
                axisNameWidget: Text('Gained/Lost', style: Theme.of(context).textTheme.bodySmall),
                axisNameSize: 50
              ),
              bottomTitles: AxisTitles(
                axisNameWidget: Text('Sport', style: Theme.of(context).textTheme.bodySmall),
                axisNameSize: 40,
              ),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false))
            ),
            minX: 0,
            maxX: 7,
            minY: 0,
            maxY: 6,
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 3),
                  const FlSpot(1, 1),
                  const FlSpot(2, 4),
                  const FlSpot(3, 2),
                  const FlSpot(4, 5),
                  const FlSpot(5, 3),
                  const FlSpot(6, 4),
                ],
                isCurved: true,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
                barWidth: 8,
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
              onChanged: () {} // TODO
            ),
          ),
        ],
      )
    ]
  );
}