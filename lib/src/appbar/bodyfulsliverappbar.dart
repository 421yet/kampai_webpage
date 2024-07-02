import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kampai_webpage/src/constants.dart';
import 'package:kampai_webpage/src/home/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BodyfulSliverAppBar {
  // const BodyfulSliverAppBar();

  static List<Widget> build(
      BuildContext context, ScrollController controller, Widget body) {
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
            padding: const EdgeInsets.only(top: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'Kampai Sushi Bar',
                  style: GoogleFonts.prata(fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Flex(
                    mainAxisSize: MainAxisSize.min,
                    direction: deviceWidth(context) < 16 * 4 + 600
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                        ),
                        onPressed: () => launchUrlString('tel://3143672020'),
                        child: const Text('(314) 367-2020',
                            style: TextStyle(fontSize: 16)),
                      ),
                      const Text(
                        'TY Sam :)',
                        style: TextStyle(fontSize: 10),
                      ),
                      const SizedBox(height: 20),
                      const Text('4949 West Pine Boulevard'),
                      const Text('Saint Louis, Missouri'),
                      Divider(
                        thickness: 0,
                        indent: deviceWidth(context) * 2 / 5,
                        endIndent: deviceWidth(context) * 2 / 5,
                      ),
                      TextButton(
                        child: const Text('kampai4949stl@gmail.com'),
                        onPressed: () {
                          Clipboard.setData(
                            const ClipboardData(
                                text: 'kampai4949stl@gmail.com'),
                          );
                          showSnackBar(
                            'Our email address was copied to your clipboard.',
                            context,
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              foregroundColor: Colors.white,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 5),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.arrow_drop_up),
                                      ],
                                    ),
                                    Text(
                                      'Back To Top',
                                      style: TextStyle(),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onPressed: () {
                              controller
                                  .jumpTo(controller.position.minScrollExtent);
                            }),
                      ),
                    ],
                  ),
                ),
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
    collapsedHeight: deviceHeight(context) / 10,
    scrolledUnderElevation: 5,
    floating: false,
    pinned: true,
    snap: false,
    foregroundColor: Colors.white,
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
              Colors.black.withOpacity(.1),
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
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: SvgPicture.asset(
                  'assets/images/kampai_white_font.svg',
                  height: deviceHeight(context) / 10,
                ),
                onTap: () {
                  lazyPush(context, const Home());
                },
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
