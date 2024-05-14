import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kampai_webpage/src/constants.dart';

class MenuViewer {
  final TransformationController _controller = TransformationController();

  Widget build(BuildContext context, String asset) {
    _controller.value = Matrix4.identity() * .4;

    return Stack(
      children: [
        Container(
            width: deviceWidth(context),
            height: deviceHeight(context),
            decoration: const BoxDecoration(color: Colors.black)),
        Center(
          child: InteractiveViewer(
            transformationController: _controller,
            minScale: 0.05,
            maxScale: 1,
            constrained: false,
            boundaryMargin: const EdgeInsets.all(8),
            child: Image.asset('assets/images/menu/$asset.png'),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: IconButton.filled(
              style: IconButton.styleFrom(
                  elevation: 5,
                  backgroundColor: Colors.black,
                  shadowColor: Colors.black),
              icon: const Icon(
                Icons.close_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
