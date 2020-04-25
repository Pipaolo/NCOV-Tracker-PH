import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ncov_tracker_ph/data/models/ncov_statistic_basic.dart';
import 'package:ncov_tracker_ph/ui/home_page/widgets/updated_statistics_card_widget.dart';

class UpdatedStatisticDialogWidget extends StatelessWidget {
  final NcovStatisticBasic currentStatistics;
  final NcovStatisticBasic prevStatistics;
  const UpdatedStatisticDialogWidget(
      {Key key, this.currentStatistics, this.prevStatistics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: ScreenUtil().setHeight(400),
        width: ScreenUtil().setWidth(600),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            Text(
              'Current Update',
              style: GoogleFonts.montserrat(
                fontSize: ScreenUtil().setSp(40),
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Swiper.children(
                    autoplay: true,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.grey,
                      ),
                    ),
                    scale: 0.5,
                    viewportFraction: 1.25,
                    children: <Widget>[
                      UpdatedStatisticsCardWidget(
                        amountChanged: currentStatistics.totalInfected -
                            prevStatistics.totalInfected,
                        currentValue: currentStatistics.totalInfected,
                        prevValue: prevStatistics.totalInfected,
                        title: 'Infected',
                        increasedColor: Colors.red,
                        decreasedColor: Colors.green,
                      ),
                      UpdatedStatisticsCardWidget(
                        amountChanged: currentStatistics.totalDeaths -
                            prevStatistics.totalDeaths,
                        currentValue: currentStatistics.totalDeaths,
                        prevValue: prevStatistics.totalDeaths,
                        title: 'Deaths',
                        increasedColor: Colors.red,
                        decreasedColor: Colors.green,
                      ),
                      UpdatedStatisticsCardWidget(
                        amountChanged: currentStatistics.totalRecovered -
                            prevStatistics.totalRecovered,
                        currentValue: currentStatistics.totalRecovered,
                        prevValue: prevStatistics.totalRecovered,
                        title: 'Recovered',
                        increasedColor: Colors.green,
                        decreasedColor: Colors.red,
                      ),
                      UpdatedStatisticsCardWidget(
                        amountChanged: currentStatistics.totalTestsConducted -
                            prevStatistics.totalTestsConducted,
                        currentValue: currentStatistics.totalTestsConducted,
                        prevValue: prevStatistics.totalTestsConducted,
                        title: 'Tests Conducted',
                        increasedColor: Colors.green,
                        decreasedColor: Colors.red,
                      ),
                    ],
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
