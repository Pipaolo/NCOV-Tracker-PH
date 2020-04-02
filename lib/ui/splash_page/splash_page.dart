import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes/router.gr.dart';
import 'bloc/splash_page_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1080);

    return BlocListener<SplashPageBloc, SplashPageState>(
      listener: (ctx, state) {
        if (state is AppOpenedOnce) {
          Future.delayed(
              Duration(seconds: 3),
              () =>
                  Router.navigator.pushReplacementNamed(Routes.homePageRoute));
        } else if (state is AppNotOpenedOnce) {
          Future.delayed(
              Duration(seconds: 3),
              () => Router.navigator
                  .pushReplacementNamed(Routes.introductionPageRoute));
        }
      },
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/medical.svg',
                  width: 300,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'NCOV Tracker PH',
                  style: GoogleFonts.raleway(
                    fontSize: 50.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
