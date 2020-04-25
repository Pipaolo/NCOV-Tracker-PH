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
          return Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: BarChart(
                      BarChartData(
                        maxY: 600,
                        groupsSpace: 4,
                        alignment: BarChartAlignment.center,
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
                                  .setSp(20, allowFontScalingSelf: true),
                              color: Colors.black,
                              wordSpacing: 10,
                            ),
                            margin: 10,
                            rotateAngle: 90,
                            reservedSize: 50,
                            getTitles: (double value) {
                              switch (value.toInt()) {
                                case 0:
                                  return '0-4';
                                  break;
                                case 1:
                                  return '5-9';
                                  break;
                                case 2:
                                  return '10-14';
                                  break;
                                case 3:
                                  return '15-19';
                                  break;
                                case 4:
                                  return '20-24';
                                  break;
                                case 5:
                                  return '25-29';
                                  break;
                                case 6:
                                  return '30-34';
                                  break;
                                case 7:
                                  return '35-39';
                                  break;
                                case 8:
                                  return '40-44';
                                  break;
                                case 9:
                                  return '45-49';
                                  break;
                                case 10:
                                  return '50-54';
                                  break;
                                case 11:
                                  return '55-59';
                                  break;
                                case 12:
                                  return '60-64';
                                  break;
                                case 13:
                                  return '65-69';
                                  break;
                                case 14:
                                  return '70-74';
                                  break;
                                case 15:
                                  return '75-79';
                                  break;
                                case 16:
                                  return '80+';
                                  break;
                                default:
                                  return '';
                              }
                            },
                          ),
                          leftTitles: SideTitles(
                            showTitles: true,
                            textStyle: TextStyle(
                                color: const Color(
                                  0xff939393,
                                ),
                                fontSize: 10),
                            getTitles: (double value) {
                              return value.toInt().toString();
                            },
                            interval: 100,
                            margin: 20,
                          ),
                        ),
                        gridData: FlGridData(
                          show: true,
                          checkToShowHorizontalLine: (value) => value % 50 == 0,
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
            ],
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
