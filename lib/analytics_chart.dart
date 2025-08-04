import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsChart extends StatelessWidget {
  const AnalyticsChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 10,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: theme.colorScheme.outline.withValues(alpha: 0.3),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 20,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}%',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.outline,
                    fontSize: 12,
                  ),
                );
              },
              reservedSize: 40,
            ),
          ),
        ),
        // Border settings
        borderData: FlBorderData(show: false),

        // Chart boundaries
        minX: 0,
        maxX: 19,
        minY: 40,
        maxY: 100,
        // Line data
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 78.2),
              const FlSpot(1, 76.8),
              const FlSpot(2, 77.5),
              const FlSpot(3, 78.1),
              const FlSpot(4, 79.3),
              const FlSpot(5, 78.7),
              const FlSpot(6, 79.8),
              const FlSpot(7, 80.2),
              const FlSpot(8, 81.1),
              const FlSpot(9, 82.3),
              const FlSpot(10, 83.2),
              const FlSpot(11, 84.1),
              const FlSpot(12, 82.8),
              const FlSpot(13, 83.5),
              const FlSpot(14, 84.7),
              const FlSpot(15, 85.3),
              const FlSpot(16, 86.1),
              const FlSpot(17, 87.4),
              const FlSpot(18, 88.2),
              const FlSpot(19, 89.1),
            ],
            isCurved: true,
            curveSmoothness: 0.2,
            color: theme.colorScheme.inverseSurface,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: theme.colorScheme.inverseSurface.withValues(alpha: 0.1),
            ),
          ),
          // Faint background line with dots only (around 40% mark)
          LineChartBarData(
            spots: [
              const FlSpot(0, 41),
              const FlSpot(1, 40),
              const FlSpot(2, 42),
              const FlSpot(3, 41),
              const FlSpot(4, 43),
              const FlSpot(5, 42),
              const FlSpot(6, 44),
              const FlSpot(7, 43),
              const FlSpot(8, 45),
              const FlSpot(9, 44),
              const FlSpot(10, 46),
              const FlSpot(11, 45),
              const FlSpot(12, 47),
              const FlSpot(13, 46),
              const FlSpot(14, 48),
              const FlSpot(15, 47),
              const FlSpot(16, 49),
              const FlSpot(17, 48),
              const FlSpot(18, 50),
              const FlSpot(19, 49),
            ],
            isCurved: false,
            color: Colors.transparent,
            barWidth: 0,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 2,
                  color: theme.colorScheme.inverseSurface.withValues(
                    alpha: 0.5,
                  ),
                  strokeWidth: 0,
                );
              },
            ),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
