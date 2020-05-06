import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ncov_tracker_ph/ui/home_page/widgets/age_graph_legend.dart';

import '../bloc/graph_bloc/graph_bloc.dart';

class AgeCategoryBarChartWidget extends StatefulWidget {
  const AgeCategoryBarChartWidget({Key key}) : super(key: key);

  @override
  _AgeCategoryBarChartWidgetState createState() =>
      _AgeCategoryBarChartWidgetState();
}

class _AgeCategoryBarChartWidgetState extends State<AgeCategoryBarChartWidget> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final List<String> chartAgeLabels = [
    '0-4',
    '5-9',
    '10-14',
    '15-19',
    '20-24',
    '25-29',
    '30-34',
    '35-39',
    '40-44',
    '45-49',
    '50-54',
    '55-59',
    '60-64',
    '65-69',
    '70-74',
    '75-79',
    '80+',
  ];
  final List<BarChartGroupData> data = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GraphBloc, GraphState>(
      builder: (context, state) {
        if (state is GraphLoading) {
          return Container(
            height: 200,
            width: double.infinity,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is GraphSuccess) {
          return Container(
            height: ScreenUtil().uiHeightPx * 0.25,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  right: 20,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceEvenly,
                      barTouchData: BarTouchData(
                        enabled: true,
                        allowTouchBarBackDraw: true,
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.grey,
                          getTooltipItem: (
                            BarChartGroupData group,
                            int groupIndex,
                            BarChartRodData rod,
                            int rodIndex,
                          ) {
                            String genderData = '';
                            switch (rodIndex) {
                              case 0:
                                genderData = 'Female';
                                break;
                              case 1:
                                genderData = 'Male';
                                break;
                            }
                            final TextStyle textStyle = TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            );

                            return BarTooltipItem(
                                genderData + "\n" + rod.y.toInt().toString(),
                                textStyle);
                          },
                        ),
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: true,
                          textStyle: TextStyle(
                            fontSize: ScreenUtil()
                                .setSp(21, allowFontScalingSelf: true),
                            color: Colors.black,
                            wordSpacing: 10,
                          ),
                          margin: 5,
                          rotateAngle: 90,
                          getTitles: (double value) {
                            return chartAgeLabels[value.toInt()];
                          },
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                          textStyle: TextStyle(
                            color: const Color(
                              0xff939393,
                            ),
                            fontSize: ScreenUtil().setSp(20),
                          ),
                          getTitles: (double value) {
                            return value.toInt().toString();
                          },
                          interval: 100,
                        ),
                      ),
                      gridData: FlGridData(
                        show: true,
                        checkToShowHorizontalLine: (value) => value % 100 == 0,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: Color(0xffe7e8ec),
                          strokeWidth: 1,
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: state.barChartData,
                    ),
                  ),
                ),
                AgeGraphLegendWidget(
                  leftBarColor: leftBarColor,
                  rightBarColor: rightBarColor,
                )
              ],
            ),
          );
        } else if (state is GraphError) {
          return Container(
            child: Text('Woops something bad happened :(.'),
          );
        }
        return Container();
      },
    );
  }
}
