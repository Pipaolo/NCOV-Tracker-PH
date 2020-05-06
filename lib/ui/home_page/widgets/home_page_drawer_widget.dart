import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ncov_tracker_ph/ui/cases_page/bloc/cases_page_bloc.dart';

import '../../../routes/router.gr.dart';
import '../../hospital_listings_page/bloc/hospital_bloc.dart';
import 'doh_emergency_dialog_widget.dart';

class HomePageDrawerWidget extends StatelessWidget {
  const HomePageDrawerWidget({Key key}) : super(key: key);

  _showDOHDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: DOHEmergencyDialogWidget(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue, Colors.blue.withOpacity(0.5)],
            stops: [0.6, 0.65, 1],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/medical.svg',
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    const SizedBox(height: 10),
                    AutoSizeText(
                      'NCOV Tracker PH',
                      style: GoogleFonts.montserrat(
                        fontSize: ScreenUtil().setSp(40),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.userInjured,
                      color: Colors.blueAccent,
                    ),
                    trailing: FaIcon(FontAwesomeIcons.angleRight),
                    title: Text('Cases'),
                    onTap: () {
                      context.bloc<CasesPageBloc>()..add(CasesFetched());
                      ExtendedNavigator.of(context).pop();
                      ExtendedNavigator.of(context)
                          .pushNamed(Routes.casesPageRoute);
                      // Flushbar(
                      //   title: '🛠👷‍♀️ Under Development 👷‍♂️🛠',
                      //   message: 'This feature is coming soon!',
                      //   margin: const EdgeInsets.all(10),
                      //   borderRadius: 10,
                      //   reverseAnimationCurve: Curves.easeOut,
                      //   duration: Duration(seconds: 2),
                      // )..show(context);
                    },
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.hospital,
                      color: Colors.blueAccent,
                    ),
                    trailing: FaIcon(FontAwesomeIcons.angleRight),
                    title: Text('Hospital Directories'),
                    onTap: () {
                      ExtendedNavigator.of(context).pop();
                      BlocProvider.of<HospitalBloc>(context)
                        ..add(HospitalListingsPressed());
                      ExtendedNavigator.of(context)
                          .pushNamed(Routes.hospitalListingsPageRoute);
                    },
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.infoCircle,
                      color: Colors.blueAccent,
                    ),
                    trailing: FaIcon(FontAwesomeIcons.angleRight),
                    title: Text('About The App'),
                    onTap: () {
                      ExtendedNavigator.of(context).pop();
                      ExtendedNavigator.of(context).pushInfoPageRoute();
                    },
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.phoneAlt,
                      color: Colors.blueAccent,
                    ),
                    trailing: FaIcon(FontAwesomeIcons.angleRight),
                    title: Text('DOH Emergency Hotline'),
                    onTap: () {
                      ExtendedNavigator.of(context).pop();
                      _showDOHDialog(context);
                    },
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.mapMarkedAlt,
                      color: Colors.blueAccent,
                    ),
                    trailing: FaIcon(FontAwesomeIcons.angleRight),
                    title: Text('NCOV Heat Map'),
                    onTap: () {
                      ExtendedNavigator.of(context).pushMapPageRoute();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
