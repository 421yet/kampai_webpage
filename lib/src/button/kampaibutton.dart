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

class _KampaiButtonState extends State<KampaiButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(
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
    );
  }
}
