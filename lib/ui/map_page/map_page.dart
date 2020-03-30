import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: double.infinity,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned.fill(
              top: -70,
              bottom: -40,
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://endcov.ph/map/',
                gestureNavigationEnabled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
