import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ncov_tracker_ph/ui/home_page/bloc/graph_bloc/graph_bloc.dart';
import 'package:ncov_tracker_ph/ui/home_page/widgets/line_chart_card_widget.dart';

class LineChartCarouselWidget extends StatelessWidget {
  const LineChartCarouselWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GraphBloc, GraphState>(builder: (context, state) {
      if (state is GraphSuccess) {
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: 20,
          ),
          height: ScreenUtil().setHeight(600),
          child: Swiper(
            viewportFraction: 0.89,
            scale: 0.5,
            curve: Curves.easeInOut,
            itemCount: state.lineChartData.entries.length,
            itemBuilder: (context, i) {
              final chartTitle =
                  state.rawCumulativeStats.entries.elementAt(i).key;
              final lineChartData = state.lineChartData[chartTitle];
              return LineChartCardWidget(
                chartTitle: chartTitle,
                lineChartBarData: lineChartData,
                rawCumulativeStats: state.rawCumulativeStats[chartTitle],
              );
            },
            autoplay: true,
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: Colors.grey,
                activeColor: Colors.greenAccent,
              ),
            ),
          ),
        );
      }
      return Container();
    });
  }
}
