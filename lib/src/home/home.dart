import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                        ElevatedButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.black.withAlpha(228),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          onPressed: doNothing,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'MENU',
                              style: TextStyle(
                                fontSize: kDefaultFontSize * 2,
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 1, height: deviceHeight(context) / 10),
                      ],
                    ),
                  ),
                ),
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
