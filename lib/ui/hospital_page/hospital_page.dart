import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ncov_tracker_ph/data/models/hospital.dart';
import 'package:ncov_tracker_ph/ui/hospital_page/widgets/hospital_info_widget.dart';

class HospitalPage extends StatelessWidget {
  final Hospital hospital;
  const HospitalPage({Key key, this.hospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Center(
                          child: Text(
                            'Contact Info',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(60),
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: HospitalInfoWidget(
                                infoType: 'Address',
                                infoContents: hospital.address,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: HospitalInfoWidget(
                                infoType: 'Type',
                                infoContents: hospital.type,
                              ),
                            ),
                            _buildContactInfo(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildHeaders(context),
          ],
        ),
      ),
    );
  }

  Column _buildContactInfo() {
    int count = 0;
    int emailCount = 0;
    final widgets = hospital.contactInfo.map((e) {
      if (e.contains('@')) {
        emailCount++;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: HospitalInfoWidget(
            infoType: 'Email $emailCount: ',
            infoContents: e,
          ),
        );
      } else {
        count++;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: HospitalInfoWidget(
            infoType: 'Contact Number $count: ',
            infoContents: e,
          ),
        );
      }
    }).toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  _buildHeaders(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: FaIcon(FontAwesomeIcons.arrowLeft),
            onPressed: () => ExtendedNavigator.of(context).pop(),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 10,
            ),
            child: AutoSizeText(
              hospital.name,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(40),
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}
