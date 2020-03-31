import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class MapLoadingDialogWidget extends StatelessWidget {
  const MapLoadingDialogWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(
              'Loading Heat Map...',
              style: GoogleFonts.robotoCondensed(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
