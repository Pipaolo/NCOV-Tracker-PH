import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ncov_tracker_ph/ui/hospital_listings_page/widgets/hospital_listings_card_widget.dart';

import '../../data/models/hospital.dart';
import 'bloc/hospital_bloc.dart';
import 'widgets/hospital_listings_search_bar_widget.dart';

class HospitalListingsPage extends StatelessWidget {
  const HospitalListingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Listings'),
        centerTitle: true,
      ),
      body: BlocBuilder<HospitalBloc, HospitalState>(
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

  _buildSuccess(List<Hospital> hospitalListings, BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => BlocProvider.of<HospitalBloc>(context)
        ..add(
          HospitalListingsPressed(),
        ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HospitalListingsSearchBarWidget(),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: hospitalListings.length,
              itemBuilder: (context, i) {
                final hospital = hospitalListings[i];
                return HospitalListingsCardWidget(
                  hospital: hospital,
                );
              }),
        ],
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
