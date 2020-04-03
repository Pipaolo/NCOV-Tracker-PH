import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ncov_tracker_ph/data/models/ncov_statistic_basic.dart';

import 'basic_data_card_widget.dart';

class BasicStatisticsWidget extends StatelessWidget {
  final NcovStatisticBasic statisticBasic;
  const BasicStatisticsWidget({Key key, this.statisticBasic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [
      BasicDataCardWidget(
        title: 'Infected',
        value: statisticBasic.totalInfected.toString(),
        svgPath: 'assets/images/infected.svg',
      ),
      BasicDataCardWidget(
        title: 'Recovered',
        value: statisticBasic.totalRecovered.toString(),
        svgPath: 'assets/images/recovered.svg',
      ),
      BasicDataCardWidget(
        title: 'Deaths',
        value: statisticBasic.totalDeaths.toString(),
        svgPath: 'assets/images/death.svg',
      ),
      BasicDataCardWidget(
        title: 'PUIs',
        value: statisticBasic.totalPUIs.toString(),
        svgPath: 'assets/images/pui.svg',
      ),
      if (!statisticBasic.totalPUMs.toString().contains('null'))
        BasicDataCardWidget(
          title: 'PUMs',
          value: statisticBasic.totalPUMs.toString(),
          svgPath: 'assets/images/pums.svg',
        ),
      BasicDataCardWidget(
        title: 'PUIs Tested',
        value: statisticBasic.totalPUIsTested.toString(),
        svgPath: 'assets/images/tests_conducted.svg',
      ),
    ];
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      height: ScreenUtil().setHeight(400),
      child: Swiper(
        viewportFraction: 0.89,
        scale: 0.5,
        curve: Curves.easeInOut,
        itemCount: widgets.length,
        itemBuilder: (context, i) {
          return widgets[i];
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
}
