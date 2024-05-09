import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    toolbarHeight: deviceHeight(context) / 10,
    floating: false,
    pinned: true,
    snap: false,
    backgroundColor: Colors.transparent,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          // stops: const <double>[0.1, 0.9],
          colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.4),
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0),
          ],
        ),
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: <Color>[Colors.black, Colors.transparent],
        // ),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(4),
        child: SizedBox(
          height: deviceHeight(context) / 5,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: SvgPicture.asset('assets/images/kampai_white_font.svg',
                height: deviceHeight(context) / 10),
          ),
        ),
      ),
    ],
  );
}
