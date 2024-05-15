import 'package:flutter/material.dart';
import 'package:kampai_webpage/src/appbar/bodyfulsliverappbar.dart';
import 'package:kampai_webpage/src/constants.dart';
import 'package:kampai_webpage/src/drawer/kampai_drawer.dart';

/// AND HOURS!
class Contact extends StatelessWidget {
  const Contact({super.key});

  static const routeName = '/Contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: KampaiDrawer(context).builder(),
        body: CustomScrollView(
          slivers: BodyfulSliverAppBar.build(
            context,
            Flex(
              direction: deviceHeight(context) > deviceWidth(context)
                  ? Axis.horizontal
                  : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Column>[],
            ),
          ),
        ));
  }
}
