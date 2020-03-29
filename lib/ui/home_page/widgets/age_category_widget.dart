import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/graph_bloc/graph_bloc.dart';
import 'age_category_legend_widget.dart';

class AgeCategoryWidget extends StatefulWidget {
  const AgeCategoryWidget({Key key}) : super(key: key);

  @override
  _AgeCategoryWidgetState createState() => _AgeCategoryWidgetState();
}

class _AgeCategoryWidgetState extends State<AgeCategoryWidget> {
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
          return Stack(
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.center,
                    maxY: 400,
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
                        margin: 10,
                        textStyle: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          wordSpacing: 10,
                        ),
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return '1-9';
                            case 1:
                              return '10-19';
                            case 2:
                              return '20-29';
                            case 3:
                              return '30-39';
                            case 4:
                              return '40-49';
                            case 5:
                              return '50-59';
                            case 6:
                              return '60-69';
                            case 7:
                              return '70-79';
                            case 8:
                              return '80-89';
                            case 9:
                              return '90-99';
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
                        interval: 200,
                        margin: 0,
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      checkToShowHorizontalLine: (value) => value % 40 == 0,
                      getDrawingHorizontalLine: (value) => const FlLine(
                        color: Color(0xffe7e8ec),
                        strokeWidth: 1,
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    groupsSpace: 15,
                    barGroups: state.chartData,
                  ),
                ),
              ),
              AgeCategoryLegendWidget(
                leftBarColor: leftBarColor,
                rightBarColor: rightBarColor,
              )
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
