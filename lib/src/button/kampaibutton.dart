import 'package:flutter/material.dart';
import 'package:kampai_webpage/src/constants.dart';

class KampaiButton extends StatefulWidget {
  final Widget child;
  final Function()? onPressed;
  final Size? size;
  const KampaiButton(
      {super.key, required this.child, required this.onPressed, this.size});

  @override
  State<StatefulWidget> createState() => _KampaiButtonState();
}

// TODO "dragged along" by the mouse up to a certain point, inertian swing post said point.
// Resistance to being dragged along?

class _KampaiButtonState extends State<KampaiButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  )..fling(
      velocity: 1,
      springDescription: SpringDescription.withDampingRatio(
          mass: 1, stiffness: 1, ratio: 1)); // ?????????????????????????
  Offset mousePos = Offset.zero;
  late Offset position;
  final GlobalKey _key = GlobalKey(); // "expensive"...

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? whatFor) {
            return Transform.rotate(
              origin: const Offset(0, -131),
              angle: arctanOffset(mousePos, findXY(_key)),
              child: MouseRegion(
                onExit: (event) {
                  setState(() {
                    mousePos = event.position;
                  });
                },
                child: ElevatedButton(
                  key: _key,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    // minimumSize: const Size(60, 300),
                    backgroundColor: const Color.fromARGB(255, 225, 28, 13),
                    elevation: 7,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  onPressed: widget.onPressed,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 300),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '◆',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        const Spacer(),
                        widget.child,
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Offset findXY(GlobalKey key) {
    BuildContext? context = key.currentContext;
    if (context == null) return mousePos;
    RenderBox box = context.findRenderObject() as RenderBox;
    return box.localToGlobal(Offset.zero);
  }
}
