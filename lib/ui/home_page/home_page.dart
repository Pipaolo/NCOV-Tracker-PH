import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/ncov_statistic_basic.dart';
import 'bloc/home_page_bloc.dart';
import 'widgets/age_category_widget.dart';
import 'widgets/basic_statistics_widget.dart';
import 'widgets/info_dialog_widget.dart';
import 'widgets/region_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: InfoDialogWidget(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('NCOV Tracker PH'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () => _showInfoDialog(context),
            ),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
            if (state is HomePageLoading) {
              return _buildLoading();
            } else if (state is HomePageSuccess) {
              return _buildSuccess(
                  state.ncovStatisticBasic, state.ncovInfecteds, context);
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
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Text('Woops something bad happened!'),
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
    );
  }

  _buildSuccess(NcovStatisticBasic statisticBasic,
      Map<String, dynamic> ncovInfecteds, BuildContext context) {
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
                BasicStatisticsWidget(
                  statisticBasic: statisticBasic,
                ),
                Center(
                  child: AutoSizeText(
                    'Confirmed Cases By Age Group',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(40),
                    ),
                    maxLines: 1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AgeCategoryWidget(),
                Center(
                  child: Text(
                    'Regions Infected',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(40),
                    ),
                  ),
                ),
              ],
            ),
          ),
          RegionListWidget(
            ncovInfecteds: ncovInfecteds,
          ),
        ],
      ),
    );
  }
}
