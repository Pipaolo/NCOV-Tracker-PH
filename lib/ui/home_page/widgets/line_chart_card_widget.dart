import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ncov_tracker_ph/data/models/cumulative_statistic.dart';

class LineChartCardWidget extends StatelessWidget {
  final String chartTitle;
  final List<CumulativeStatistic> rawCumulativeStats;
  final LineChartBarData lineChartBarData;
  const LineChartCardWidget({
    Key key,
    @required this.chartTitle,
    @required this.rawCumulativeStats,
    @required this.lineChartBarData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (chartTitle.contains('deaths'))
          Text(
            'Deaths',
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(36),
            ),
          ),
        if (chartTitle.contains('recoveries'))
          Text(
            'Recoveries',
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(36),
            ),
          ),
        if (chartTitle.contains('testsConducted'))
          Text(
            'Tests Conducted',
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(36),
            ),
          ),
        if (chartTitle.contains('confirmed'))
          Text(
            'Infected',
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(36),
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Center(
            child: LineChart(
              LineChartData(
                  gridData: FlGridData(
                    show: false,
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 10,
                      rotateAngle: 60,
                      textStyle: const TextStyle(
                          color: Color(0xff68737d),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      getTitles: (value) {
                        final convertedDate = DateFormat('MMM dd').format(
                            DateTime.parse(
                                rawCumulativeStats[value.toInt()].date));
                        return convertedDate;
                      },
                      margin: 8,
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      textStyle: const TextStyle(
                        color: Color(0xff67727d),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      interval: (chartTitle.contains('testsConducted'))
                          ? 10000
                          : (chartTitle.contains('confirmed')) ? 1000 : 200,
                      getTitles: (value) {
                        final valueConverted =
                            (chartTitle.contains('testsConducted'))
                                ? (value / 10000).round() * 10000
                                : (chartTitle.contains('confirmed'))
                                    ? (value / 1000).round() * 1000
                                    : (value / 200).round() * 200;
                        return valueConverted.toString();
                      },
                      reservedSize: 28,
                      margin: 20,
                    ),
                  ),
                  lineBarsData: [lineChartBarData],
                  lineTouchData: LineTouchData(
                      enabled: true,
                      touchTooltipData:
                          LineTouchTooltipData(getTooltipItems: (spots) {
                        return [
                          LineTooltipItem(
                            'Date: ${DateFormat('MMM dd, yyyy').format(DateTime.parse(rawCumulativeStats[spots.first.x.toInt()].date))}\n Value: ${spots.first.y.toInt()}',
                            const TextStyle(
                              color: Color(0xff67727d),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ];
                      }))),
            ),
          ),
        ),
      ],
    );
  }
}
