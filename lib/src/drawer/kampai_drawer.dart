import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kampai_webpage/src/catering/catering.dart';
import 'package:kampai_webpage/src/constants.dart';
import 'package:kampai_webpage/src/contact/contact.dart';
import 'package:kampai_webpage/src/home/home.dart';

class KampaiDrawer {
  final BuildContext context;

  KampaiDrawer(this.context);

  Drawer builder() {
    /// TODO (low) I want to make it less wide but I need to wrap it in a sized box/container
    return Drawer(
      elevation: 10,
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                lazyPush(context, const Contact());
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Hours & Contact',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                lazyPush(context, const Catering());
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Catering',
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: null,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 16,
                    // TODO uncomment below when deployed
                    // decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                lazyPush(context, const Home());
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('More stuff coming soon'),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Made by Frank with TLC'),
                      Text('♥', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  Text('v 1.4.1'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
