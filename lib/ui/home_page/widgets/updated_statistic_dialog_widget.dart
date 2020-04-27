import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ncov_tracker_ph/data/models/ncov_statistic_basic.dart';

import 'basic_data_card_widget.dart';

class UpdatedStatisticDialogWidget extends StatelessWidget {
  final NcovStatisticBasic currentStatistics;
  const UpdatedStatisticDialogWidget({Key key, this.currentStatistics})
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
            const SizedBox(height: 10),
            Text(
              'Current Update',
              style: GoogleFonts.montserrat(
                fontSize: ScreenUtil().setSp(40),
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
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
                    scale: 0.50,
                    viewportFraction: 0.95,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BasicDataCardWidget(
                          title: 'Infected',
                          currentValue: currentStatistics.totalInfected,
                          prevValue: currentStatistics.prevInfected,
                          svgPath: 'assets/images/infected.svg',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BasicDataCardWidget(
                          title: 'Recovered',
                          currentValue: currentStatistics.totalRecovered,
                          prevValue: currentStatistics.prevRecovered,
                          svgPath: 'assets/images/recovered.svg',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BasicDataCardWidget(
                          title: 'Deaths',
                          currentValue: currentStatistics.totalDeaths,
                          prevValue: currentStatistics.prevDeaths,
                          svgPath: 'assets/images/death.svg',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BasicDataCardWidget(
                          title: 'Tests Conducted',
                          currentValue: currentStatistics.totalTestsConducted,
                          prevValue: currentStatistics.prevTestsConducted,
                          svgPath: 'assets/images/tests_conducted.svg',
                        ),
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
