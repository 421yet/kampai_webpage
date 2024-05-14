import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kampai_webpage/src/constants.dart';
import 'package:url_launcher/url_launcher.dart';

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
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Flex(
                    mainAxisSize: MainAxisSize.min,
                    direction: deviceWidth(context) < 16 * 4 + 480
                        ? Axis.vertical
                        : Axis.horizontal,
                    children: <Widget>[
                      Padding(
                        // DoorDash
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                            onPressed: () async {
                              launchUrl(Uri.parse(
                                  'https://www.doordash.com/store/kampai-sushi-bar-st.-louis-27486584/'));
                            },
                            style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              backgroundColor: Colors.white,
                            ),
                            child: SvgPicture.asset(
                              'assets/images/delivery/DoorDash_Logo.svg',
                              width: 100,
                            )),
                      ),
                      Padding(
                        // Uber Eats
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                          onPressed: () async {
                            launchUrl(Uri.parse(
                                'https://www.ubereats.com/store/kampai-sushi-bar/NS2YV5htSkS0xn21bQMlrw'));
                          },
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                            backgroundColor: Colors.white,
                          ),
                          child: SvgPicture.asset(
                            'assets/images/delivery/Uber_Eats_2020_logo.svg',
                            width: 100,
                          ),
                        ),
                      ),
                      Padding(
                        // GrubHub
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                          onPressed: () async {
                            await launchUrl(Uri.parse(
                                'https://www.grubhub.com/restaurant/2101256'));
                          },
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                            backgroundColor: Colors.white,
                          ),
                          child: SvgPicture.asset(
                            'assets/images/delivery/GrubHub_2021.svg',
                            width: 100,
                          ),
                        ),
                      ),
                      Padding(
                        // Clover
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                          onPressed: () async {
                            await launchUrl(Uri.parse(
                                'https://food.google.com/chooseprovider?restaurantId=%2Fg%2F1vg6v8fy'));
                          },
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                            backgroundColor: Colors.white,
                          ),
                          child: SvgPicture.asset(
                            'assets/images/delivery/Clover_mobile_app_Logo.svg',
                            width: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Text>[
                      Text(
                        'Kampai Sushi Bar',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text('\n(314) 326-7522\n'),
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
