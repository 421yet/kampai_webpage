import 'package:flutter/material.dart';
import 'package:kampai_webpage/src/appbar/bodyfulsliverappbar.dart';
import 'package:kampai_webpage/src/drawer/kampai_drawer.dart';

/// AND HOURS!
class About extends StatelessWidget {
  const About({super.key});

  static const routeName = '/About';

  /// TODO make the fucking thing
  final Column aboutBody = const Column();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: KampaiDrawer(context).builder(),
        body: CustomScrollView(
          slivers: BodyfulSliverAppBar.build(
            context,
            aboutBody,
          ),
        ));
  }
}
