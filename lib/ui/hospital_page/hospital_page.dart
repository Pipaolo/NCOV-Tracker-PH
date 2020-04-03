import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/hospital.dart';
import 'widgets/hospital_header_widget.dart';
import 'widgets/hospital_info_widget.dart';

class HospitalPage extends StatelessWidget {
  final Hospital hospital;
  const HospitalPage({Key key, this.hospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: CustomScrollView(
            slivers: <Widget>[
              HospitalHeaderWidget(
                hospitalName: hospital.name,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
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
                ]),
              )
            ],
          ),
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
}
