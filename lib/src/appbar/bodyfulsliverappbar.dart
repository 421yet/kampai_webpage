import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kampai_webpage/src/constants.dart';

class BodyfulSliverAppBar {
  // const BodyfulSliverAppBar();

  static List<Widget> build(BuildContext context, Widget body) {
    return <Widget>[
      _kampaiAppBarKernel(context),
      SliverToBoxAdapter(child: body),
      SliverToBoxAdapter(
          child: Container(
        height: deviceHeight(context) / 10,
        width: deviceWidth(context),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black],
          ),
        ),
      )),
      SliverToBoxAdapter(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                            backgroundColor: Colors.white,
                          ),
                          child: const Text('Doordash')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text('UberEats'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text('GrubHub'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text('Clover'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Text>[
                      Text('Kampai Sushi Bar'),
                      Text('(314) 326-7522'),
                      Text('4949 West Pine Boulevard'),
                      Text('Saint Louis, Missouri'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ];
  }
}

SliverAppBar _kampaiAppBarKernel(BuildContext context) {
  return SliverAppBar(
    elevation: 0,
    expandedHeight: deviceHeight(context) / 5,
    toolbarHeight: deviceHeight(context) / 10,
    scrolledUnderElevation: 5,
    floating: false,
    pinned: true,
    snap: false,
    backgroundColor: Colors.transparent,
    forceMaterialTransparency: true,
    flexibleSpace: FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.4),
              Colors.black.withOpacity(0.1),
              Colors.black.withOpacity(0),
            ],
          ),
        ),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(4),
        child: SizedBox(
          height: deviceHeight(context) / 5,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: SvgPicture.asset(
              'assets/images/kampai_white_font.svg',
              height: deviceHeight(context) / 10,
            ),
          ),
        ),
      ),
    ],
  );
}
