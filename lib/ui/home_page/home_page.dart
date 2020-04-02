import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/bloc/connectivity_bloc.dart';
import '../../core/bloc/notification_bloc/notification_bloc.dart';
import '../../data/models/ncov_statistic_basic.dart';
import '../../data/models/region.dart';
import '../widgets/fade_in_animation_widget.dart';
import '../widgets/no_connection_widget.dart';
import 'bloc/home_page_bloc.dart';
import 'widgets/age_category_bar_chart_widget.dart';
import 'widgets/basic_statistics_widget.dart';
import 'widgets/gender_pie_chart_widget.dart';
import 'widgets/home_page_drawer_widget.dart';
import 'widgets/region_list_widget.dart';
import 'widgets/updated_statistic_dialog_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationBloc, NotificationState>(
      listener: (context, state) {
        if (state is NotificationShownState) {
          showDialog(
            context: context,
            builder: (context) {
              return UpdatedStatisticDialogWidget(
                currentStatistics: state.currentStatistic,
                prevStatistics: state.prevStatistic,
              );
            },
          );
        }
      },
      child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
          builder: (context, state) {
        switch (state) {
          case ConnectivityState.hasInternet:
            return _buildHasConnection();
            break;
          case ConnectivityState.noInternet:
            return _buildNoConnection(context);
            break;
        }
        return Container();
      }),
    );
  }

  _buildNoConnection(BuildContext context) {
    return Scaffold(
      body: NoConnectionWidget(),
    );
  }

  _buildHasConnection() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('NCOV Tracker PH'),
        ),
        drawer: HomePageDrawerWidget(),
        body: Container(
          alignment: Alignment.center,
          child: BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
            if (state is HomePageLoading) {
              return _buildLoading();
            } else if (state is HomePageSuccess) {
              // return _buildError('asdf', context);
              return _buildSuccess(state.ncovStatisticBasic,
                  state.patientsGroupedByRegion, context);
            } else if (state is HomePageError) {
              return _buildError(state.errorText, context);
            }
            return Container();
          }),
        ),
      ),
    );
  }

  _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildError(String errorText, BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/error.svg',
                    height: 150,
                  ),
                  Text(
                    'You have no internet connection. Try and refresh the page, by dragging down.',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(35),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          RefreshIndicator(
            onRefresh: () async => BlocProvider.of<HomePageBloc>(context)
              ..add(
                DataFetched(),
              ),
            child: Positioned.fill(
              child: ListView(
                children: <Widget>[],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildSuccess(NcovStatisticBasic statisticBasic,
      List<Region> patientsGroupedByRegion, BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => BlocProvider.of<HomePageBloc>(context)
        ..add(
          DataFetched(),
        ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                FadeInAnimationWidget(
                  delay: 3,
                  child: BasicStatisticsWidget(
                    statisticBasic: statisticBasic,
                  ),
                ),
                FadeInAnimationWidget(
                  delay: 3,
                  child: Center(
                    child: AutoSizeText(
                      'Confirmed Cases By Age Group',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(36),
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeInAnimationWidget(
                    delay: 3, child: AgeCategoryBarChartWidget()),
                const SizedBox(
                  height: 20,
                ),
                FadeInAnimationWidget(
                  delay: 3,
                  child: Center(
                    child: AutoSizeText(
                      'Confirmed Cases By Gender',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(36),
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeInAnimationWidget(
                  delay: 3,
                  child: GenderPieChartWidget(),
                ),
                FadeInAnimationWidget(
                  delay: 1,
                  child: Center(
                    child: Text(
                      'Regions Infected',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(40),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          RegionListWidget(
            patientsGroupedByRegion: patientsGroupedByRegion,
          ),
        ],
      ),
    );
  }
}
