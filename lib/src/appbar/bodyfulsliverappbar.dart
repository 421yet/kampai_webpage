import 'package:flutter/material.dart';
import 'package:kampai_webpage/src/constants.dart';

class BodyfulSliverAppBar {
  // const BodyfulSliverAppBar();

  static List<Widget> build(BuildContext context, Widget body) {
    return <Widget>[
      _kampaiAppBarKernel(context),
      SliverToBoxAdapter(child: body),
    ];
  }
}

SliverAppBar _kampaiAppBarKernel(BuildContext context) {
  return SliverAppBar(
    expandedHeight: deviceHeight(context) / 5,
    floating: false,
    pinned: true,
    snap: false,
    backgroundColor: Colors.transparent,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.center,
        end: Alignment.bottomCenter,
        colors: <Color>[Colors.black, Colors.transparent],
      )),
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Image(
          image: AssetImage('assets/image/logo.png'),
        ),
      ),
    ],
  );
}
