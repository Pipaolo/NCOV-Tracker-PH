import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ncov_tracker_ph/routes/router.gr.dart';
import 'package:ncov_tracker_ph/ui/home_page/widgets/doh_emergency_dialog_widget.dart';
import 'package:ncov_tracker_ph/ui/hospital_listings_page/bloc/hospital_bloc.dart';

import 'info_dialog_widget.dart';

class HomePageDrawerWidget extends StatelessWidget {
  const HomePageDrawerWidget({Key key}) : super(key: key);

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
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.hospital,
              color: Colors.blueAccent,
            ),
            trailing: FaIcon(FontAwesomeIcons.angleRight),
            title: Text('Hospital Listings'),
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
            title: Text('About me'),
            onTap: () {
              ExtendedNavigator.of(context).pop();
              _showInfoDialog(context);
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
        ],
      ),
    );
  }
}
