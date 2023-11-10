import 'package:fl_chart/fl_chart.dart';
import 'package:gweiland_flutter_task/utils/common_exports.dart';

class DashBOardCardGraph extends StatelessWidget {
  const DashBOardCardGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        height: 52.5,
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
            maxY: 6,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 3),
                  const FlSpot(1, 1),
                  const FlSpot(2, 4),
                  const FlSpot(3, 2),
                  const FlSpot(4, 5),
                  const FlSpot(5, 1),
                  const FlSpot(6, 4),
                ],
                isCurved: true,
                color: AppConstants.green,
                belowBarData: BarAreaData(
                    show: true, color: AppConstants.green.withOpacity(0.4)),
                dotData: const FlDotData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
