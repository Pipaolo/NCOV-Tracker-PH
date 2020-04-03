import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ncov_tracker_ph/core/bloc/connectivity_bloc.dart';
import 'package:ncov_tracker_ph/ui/hospital_listings_page/widgets/hospital_listings_card_widget.dart';
import 'package:ncov_tracker_ph/ui/widgets/no_connection_widget.dart';

import '../../data/models/hospital.dart';
import 'bloc/hospital_bloc.dart';
import 'widgets/hospital_listings_search_bar_widget.dart';

class HospitalListingsPage extends StatefulWidget {
  const HospitalListingsPage({Key key}) : super(key: key);

  @override
  _HospitalListingsPageState createState() => _HospitalListingsPageState();
}

class _HospitalListingsPageState extends State<HospitalListingsPage> {
  int numberOfItems = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Listings'),
        centerTitle: true,
      ),
      body: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          switch (state) {
            case ConnectivityState.hasInternet:
              return _buildHasConnection();
              break;
            case ConnectivityState.noInternet:
              return _buildNoConnection();
              break;
          }
          return Container();
        },
      ),
    );
  }

  _buildLoading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  _buildNoConnection() {
    return NoConnectionWidget();
  }

  _buildHasConnection() {
    return BlocBuilder<HospitalBloc, HospitalState>(
      builder: (context, state) {
        if (state is HospitalLoading) {
          return _buildLoading();
        } else if (state is HospitalSuccess) {
          return _buildSuccess(state.hospitalListings, context);
        } else if (state is HospitalError) {
          return _buildError(state.errorText, context);
        }
        return Container();
      },
    );
  }

  _buildSuccess(List<Hospital> hospitalListings, BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() => numberOfItems = 5);
        return BlocProvider.of<HospitalBloc>(context)
          ..add(
            HospitalListingsPressed(),
          );
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.pixels ==
                  scrollNotification.metrics.maxScrollExtent &&
              numberOfItems < hospitalListings.length) {
            setState(() => numberOfItems += 5);
          }
          return false;
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: HospitalListingsSearchBarWidget(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  final hospital = hospitalListings[i];
                  return HospitalListingsCardWidget(
                    hospital: hospital,
                  );
                },
                childCount: (numberOfItems < hospitalListings.length)
                    ? numberOfItems
                    : hospitalListings.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildError(String errorText, BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FaIcon(
                    FontAwesomeIcons.exclamationCircle,
                    color: Colors.red,
                    size: ScreenUtil().setSp(230),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Woops something bad happened! Please try and refresh the page by dragging down the screen.',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(30),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        RefreshIndicator(
          onRefresh: () async => BlocProvider.of<HospitalBloc>(context)
            ..add(
              HospitalListingsPressed(),
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
}
