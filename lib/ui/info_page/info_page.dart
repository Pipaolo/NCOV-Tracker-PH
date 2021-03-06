import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: InfoPageAppBar(
          appBarHeight: 100,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SelectableText.rich(
                    TextSpan(
                      text: 'Made By: ',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(40),
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: '\nPaolo Matthew Tolentino',
                          style: GoogleFonts.montserrat(
                            fontSize: ScreenUtil().setSp(25),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SelectableText.rich(
                    TextSpan(
                      text: 'Contact: ',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(40),
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: '\ntolentinopaolomatthew23@gmail.com',
                          style: GoogleFonts.montserrat(
                            fontSize: ScreenUtil().setSp(25),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SelectableText.rich(
                    TextSpan(
                      text: 'About The App ',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(40),
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '\nThe app was built with a purpose of providing realtime updates about the cases of the Coronavirus in the Philippines.',
                          style: GoogleFonts.montserrat(
                            fontSize: ScreenUtil().setSp(25),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SelectableText.rich(
                    TextSpan(
                      text: 'Disclaimer:',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(40),
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '\nAll of the data that is being shown here is not mine nor do I claim it. See references below.',
                          style: GoogleFonts.montserrat(
                            fontSize: ScreenUtil().setSp(25),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SelectableText.rich(
                    TextSpan(
                      text: 'Source Code:',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(40),
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: '\nhttps://github.com/Pipaolo/NCOV-Tracker-PH',
                          style: GoogleFonts.montserrat(
                            fontSize: ScreenUtil().setSp(25),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SelectableText.rich(
                    TextSpan(
                      text: 'Special Thanks to:',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(40),
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '\nHyubs for creating an awesome api for keeping track of the COVID 19 in the Philippines.',
                          style: GoogleFonts.montserrat(
                            fontSize: ScreenUtil().setSp(25),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SelectableText.rich(
                    TextSpan(
                      text: 'References:',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(40),
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                            text: '\nDepartment of Health: ',
                            style: GoogleFonts.montserrat(
                              fontSize: ScreenUtil().setSp(25),
                            ),
                            children: [
                              TextSpan(
                                text: 'https://ncovtracker.doh.gov.ph/',
                                style: GoogleFonts.montserrat(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ]),
                        TextSpan(
                          text:
                              '\n\nUniversity of The Philippines ENDCOV Website: ',
                          style: GoogleFonts.montserrat(
                            fontSize: ScreenUtil().setSp(25),
                          ),
                          children: [
                            TextSpan(
                              text: 'https://endcov.ph',
                              style: GoogleFonts.montserrat(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        TextSpan(
                            text:
                                '\n\nGraphQL API for COVID-19 (Philippines): ',
                            style: GoogleFonts.montserrat(
                              fontSize: ScreenUtil().setSp(25),
                            ),
                            children: [
                              TextSpan(
                                text: 'https://ncovph.com',
                                style: GoogleFonts.montserrat(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ]),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SelectableText.rich(
                    TextSpan(
                      text: 'Icons:',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(40),
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '\nSplash page icon made by wanicon from www.flaticon.com',
                          style: GoogleFonts.montserrat(
                            fontSize: ScreenUtil().setSp(25),
                          ),
                        ),
                        TextSpan(
                          text:
                              '\n\nTotal Infected icon made by Freepik from www.flaticon.com',
                          style: GoogleFonts.montserrat(
                            fontSize: ScreenUtil().setSp(25),
                          ),
                        ),
                        TextSpan(
                          text:
                              '\n\nTotal Deaths icon made by Freepik from www.flaticon.com',
                          style: GoogleFonts.montserrat(
                            fontSize: ScreenUtil().setSp(25),
                          ),
                        ),
                        TextSpan(
                          text:
                              '\n\nTotal Tests Conducted icon made by Freepik from www.flaticon.com',
                          style: GoogleFonts.montserrat(
                            fontSize: ScreenUtil().setSp(25),
                          ),
                        ),
                        TextSpan(
                          text:
                              '\n\nTotal Recovered icon made by Pixel perfect from www.flaticon.com',
                          style: GoogleFonts.montserrat(
                            fontSize: ScreenUtil().setSp(25),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InfoPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;

  const InfoPageAppBar({Key key, @required this.appBarHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () => ExtendedNavigator.of(context).pop(),
            ),
          ),
          Center(
            child: Text(
              'About The App',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w800,
                fontSize: ScreenUtil().setSp(40),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        ScreenUtil().setHeight(appBarHeight),
      );
}
