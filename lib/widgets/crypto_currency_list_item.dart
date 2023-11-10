import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gweiland_flutter_task/domain/entity/user_model.dart';
import 'package:gweiland_flutter_task/values/constants.dart';
import 'package:gweiland_flutter_task/values/strings.dart';

class CryptoCurrencyCard extends StatelessWidget {
  const CryptoCurrencyCard({this.cryptoListItem, this.index, super.key});
  final Datum? cryptoListItem;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 23, // Adjust the size of the avatar
            backgroundImage:
                NetworkImage('${AppStrings.imageHost}/${index! + 1}.png'),
          ),
          const SizedBox(
            width: 8.52,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      cryptoListItem?.name?.substring(0, 3) ?? '',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppConstants.darkAccent),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    _coinGraph(),
                  ],
                ),
                Text(
                  cryptoListItem?.slug ?? '',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppConstants.darkAccent.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$ ${cryptoListItem?.quote?.usd?.price?.toStringAsFixed(2) ?? ''} ${AppStrings.usd}',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.9)),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                index!.isEven ? '-3.2 %' : '+1.8 %',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color:
                        index!.isEven ? AppConstants.red : AppConstants.green),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _coinGraph() {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      height: 24.5,
      width: 63,
      child: LineChart(
        curve: Curves.linear,
        LineChartData(
          gridData: const FlGridData(
            show: false,
          ),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: Colors.transparent,
              width: 1,
            ),
          ),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 7,
          lineBarsData: [
            LineChartBarData(
              spots: index!.isEven
                  ? [
                      const FlSpot(0, 3),
                      const FlSpot(1, 1),
                      const FlSpot(2, 4),
                      const FlSpot(3, 2),
                      const FlSpot(4, 7),
                      const FlSpot(5, 1),
                      const FlSpot(6, 0),
                    ]
                  : [
                      const FlSpot(0, 3),
                      const FlSpot(1, 1),
                      const FlSpot(2, 4),
                      const FlSpot(3, 2),
                      const FlSpot(4, 7),
                      const FlSpot(5, 1),
                      const FlSpot(6, 4),
                    ],
              isCurved: true,
              color: index!.isEven ? Colors.red : AppConstants.green,
              // belowBarData: BarAreaData(
              //     show: true, color: AppConstants.green.withOpacity(0.4)),
              dotData: const FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
