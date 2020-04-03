import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HospitalHeaderWidget extends StatelessWidget {
  final String hospitalName;
  const HospitalHeaderWidget({Key key, this.hospitalName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
        onPressed: () => ExtendedNavigator.of(context).pop(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.symmetric(horizontal: 20),
        collapseMode: CollapseMode.pin,
        title: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: AutoSizeText(
            hospitalName,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(35),
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
