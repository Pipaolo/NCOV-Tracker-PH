import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncov_tracker_ph/ui/home_page/widgets/age_graph_legend.dart';

import '../bloc/graph_bloc/graph_bloc.dart';

class GenderPieChartWidget extends StatefulWidget {
  const GenderPieChartWidget({Key key}) : super(key: key);

  @override
  _GenderPieChartWidgetState createState() => _GenderPieChartWidgetState();
}

class _GenderPieChartWidgetState extends State<GenderPieChartWidget> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);

  List<PieChartSectionData> data = [];

  int touchedIndex = 0;

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
          data = state.pieChartData;
          return Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: PieChart(
                      PieChartData(
                        borderData: FlBorderData(show: false),
                        sections: state.pieChartData,
                        centerSpaceRadius: 20,
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
