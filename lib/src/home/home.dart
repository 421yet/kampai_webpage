import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kampai_webpage/button/kampaibutton.dart';
import 'package:kampai_webpage/button/verticaltext.dart';
import 'package:kampai_webpage/src/appbar/bodyfulsliverappbar.dart';
import 'package:kampai_webpage/src/constants.dart';
import 'package:kampai_webpage/src/drawer/kampai_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(iconTheme: const IconThemeData(color: Colors.white)),
          drawer: KampaiDrawer(context).builder(),
          body: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(backgroundImage),
                      fit: determineFit(context, backgroundImage)),
                ),
              ),
              CustomScrollView(
                slivers: BodyfulSliverAppBar.build(
                  context,
                  SizedBox(
                    width: deviceWidth(context),
                    height: deviceHeight(context) * 4 / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // TODO "dragged along" by the mouse up to a certain point, inertian swing post said point.
                        Flex(
                          direction: deviceWidth(context) < 8 * 5 + 64 * 4
                              ? Axis.vertical
                              : Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KampaiButton(
                              child: VerticalText('SUSHI'),
                              onPressed: () {},
                              // size: Size(),
                            ),
                            KampaiButton(
                              child: VerticalText('LUNCH'),
                              onPressed: () {},
                            ),
                            KampaiButton(
                              child: VerticalText('DINNER'),
                              onPressed: () {},
                            ),
                            KampaiButton(
                              child: VerticalText('DRINKS'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(width: 1, height: deviceHeight(context) / 10),
                      ],
                    ),
                  ),
                ),
                controller: ScrollController(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

doNothing() {
  // TODO do SOMETHING
}

BoxFit determineFit(BuildContext context, String imageAddress) {
  double dH = deviceHeight(context);
  double dW = deviceWidth(context);

  // File imageFile = File(imageAdress);
  // var image = await decodeImageFromList(image.readBytesSync());
  // double imageAspectRatio = image.width / imageheight;
  double imageAspectRatio = 68 / 51; // TODO generalize this using above

  double windowAspectRatio = dW / dH;

  return (windowAspectRatio < imageAspectRatio)
      ? BoxFit.fitHeight
      : BoxFit.fitWidth;
}
