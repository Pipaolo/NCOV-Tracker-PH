import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:ncov_tracker_ph/data/models/cumulative_statistic.dart';

class LineChartCardWidget extends StatelessWidget {
  final String chartTitle;
  final int index;
  final List<CumulativeStatistic> rawCumulativeStats;
  final LineChartBarData lineChartBarData;

  static final List<Widget> chartTitles = [
    Text(
      'Deaths',
      style: GoogleFonts.raleway(
        fontWeight: FontWeight.bold,
        fontSize: ScreenUtil().setSp(34),
      ),
    ),
    Text(
      'Infected',
      style: GoogleFonts.raleway(
        fontWeight: FontWeight.bold,
        fontSize: ScreenUtil().setSp(34),
      ),
    ),
    Text(
      'Recoveries',
      style: GoogleFonts.raleway(
        fontWeight: FontWeight.bold,
        fontSize: ScreenUtil().setSp(34),
      ),
    ),
    Text(
      'Tests Conducted',
      style: GoogleFonts.raleway(
        fontWeight: FontWeight.bold,
        fontSize: ScreenUtil().setSp(34),
      ),
    ),
  ];

  const LineChartCardWidget({
    Key key,
    @required this.chartTitle,
    @required this.index,
    @required this.rawCumulativeStats,
    @required this.lineChartBarData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        chartTitles[index],
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(10, 0, 30, 0),
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
                    interval: 14,
                    rotateAngle: -60,
                    textStyle: TextStyle(
                      color: Color(0xff68737d),
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(25),
                    ),
                    getTitles: (value) {
                      final convertedDate = DateFormat('MMM dd').format(
                          DateTime.parse(
                              rawCumulativeStats[value.toInt()].date));
                      return convertedDate;
                    },
                    margin: 25,
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    textStyle: TextStyle(
                      color: Color(0xff67727d),
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(25),
                    ),
                    interval: (chartTitle.contains('testsConducted'))
                        ? 10000
                        : (chartTitle.contains('confirmed')) ? 1000 : 200,
                    getTitles: (value) {
                      //Change the side title depending on the type of data
                      String valueLabel = '';

                      if (chartTitle.contains('testsConducted')) {
                        //End the value that is greater than a thousand with
                        //k
                        valueLabel =
                            '${(value ~/ 10000)} ${(value > 0) ? 'K' : ''}';
                      } else if (chartTitle.contains('confirmed')) {
                        valueLabel =
                            '${(value ~/ 1000)} ${(value > 0) ? 'K' : ''}';
                      } else {
                        if (value >= 1000) {
                          if (value % 1000 == 0) {
                            valueLabel =
                                '${(value ~/ 1000)} ${(value > 0) ? 'K' : ''}';
                          } else {
                            valueLabel =
                                '${(value / 1000)} ${(value > 0) ? 'K' : ''}';
                          }
                        } else {
                          valueLabel = ((value ~/ 100) * 100).toString();
                        }
                      }

                      return valueLabel.toString();
                    },
                    reservedSize: 28,
                    margin: 10,
                  ),
                ),
                lineBarsData: [lineChartBarData],
                lineTouchData: LineTouchData(
                  enabled: true,
                  handleBuiltInTouches: true,
                  touchTooltipData: LineTouchTooltipData(
                    tooltipRoundedRadius: 10,
                    getTooltipItems: (spots) {
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
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
