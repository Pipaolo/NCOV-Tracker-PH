import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/bloc/connectivity_bloc.dart';
import '../widgets/no_connection_widget.dart';
import 'widgets/map_loading_dialog_widget.dart';
import 'widgets/map_refences_dialog_widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heat Map'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.infoCircle,
              size: ScreenUtil().setSp(40),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: MapReferencesDialogWidget(),
                    );
                  });
            },
          ),
        ],
      ),
      body: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          if (state == ConnectivityState.hasInternet) {
            return _buildHasInternet();
          } else if (state == ConnectivityState.noInternet) {
            return _buildNoInternet();
          }
          return Container();
        },
      ),
    );
  }

  _buildNoInternet() {
    return NoConnectionWidget();
  }

  _buildHasInternet() {
    return Center(
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned.fill(
              top: -70,
              bottom: -45,
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://endcov.ph/map/',
                gestureNavigationEnabled: true,
                onPageStarted: (string) {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => MapLoadingDialogWidget());
                },
                onPageFinished: (string) {
                  print(string);
                  ExtendedNavigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
