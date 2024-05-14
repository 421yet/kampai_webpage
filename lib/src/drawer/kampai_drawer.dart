import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kampai_webpage/src/about/about.dart';
import 'package:kampai_webpage/src/constants.dart';
import 'package:kampai_webpage/src/contact/contact.dart';

class KampaiDrawer {
  final BuildContext context;
  final GlobalKey key = GlobalKey();

  KampaiDrawer(this.context);

  NavigationDrawer builder() {
    List<Widget> children = <Widget>[
      const TextButton(
        onPressed: null,
        // onPressed: () {
        //   lazyPush(context, const About());
        // },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'About',
            style: TextStyle(
              // color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
      const TextButton(
        onPressed: null,
        // onPressed: () {
        //   lazyPush(context, const Contact());
        // },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Contact',
            style: TextStyle(
              // color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/Home');
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
      SizedBox(height: deviceHeight(context) / 2),
    ];

    return NavigationDrawer(
      elevation: 10,
      children: <Widget>[
        DrawerHeader(
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Kampai Sushi Bar',
                  style: GoogleFonts.prata(),
                ),
                Text(
                  'c.1984',
                  style: GoogleFonts.prata(),
                ),
              ],
            ),
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: children[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(indent: 8, endIndent: 8),
          itemCount: children.length,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('More stuff coming soon.'),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Made by Frank with TLC'),
                  Text('♥', style: TextStyle(color: Colors.red)),
                  Text('.'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
