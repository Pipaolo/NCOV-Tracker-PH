import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ncov_tracker_ph/routes/router.gr.dart';
import 'package:ncov_tracker_ph/ui/splash_page/bloc/splash_page_bloc.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'What is this?',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(80),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/images/info.svg',
                              width: 320,
                              height: 320,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 10,
                                      ),
                                    ]),
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'This app\'s purpose is to provide updated information about the current epidemic that is the Novel Corona Virus in the Philippines. The data that is shown here is from the Philippine Department of Health Ncov Tracker Website : https://ncovtracker.doh.gov.ph. I do not own nor claim the data shown.',
                                  style: GoogleFonts.montserrat(
                                    fontSize: ScreenUtil().setSp(33.5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                    Icon(Icons.chevron_right)
                  ],
                ),
                onPressed: () {
                  BlocProvider.of<SplashPageBloc>(context)
                    ..add(InstanceStored());
                  ExtendedNavigator.of(context)
                      .pushReplacementNamed(Routes.homePageRoute);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
