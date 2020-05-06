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
          height: ScreenUtil().uiHeightPx * 0.35,
          width: double.infinity,
          child: Swiper(
            scale: 0.5,
            curve: Curves.easeInOut,
            fade: 0,
            itemCount: state.lineChartData.entries.length,
            itemBuilder: (context, i) {
              final chartTitle =
                  state.rawCumulativeStats.entries.elementAt(i).key;
              final lineChartData = state.lineChartData[chartTitle];
              return LineChartCardWidget(
                index: i,
                chartTitle: chartTitle,
                lineChartBarData: lineChartData,
                rawCumulativeStats: state.rawCumulativeStats[chartTitle],
              );
            },
            autoplay: true,
            autoplayDelay: 15000,
            duration: 1000,
            autoplayDisableOnInteraction: true,
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
