import 'package:flutter/material.dart';

class CountableInt extends StatefulWidget {
  final int index;
  const CountableInt(this.index, {super.key});

  @override
  State<CountableInt> createState() => _CountableIntState();
}

class _CountableIntState extends State<CountableInt> {
  int get index => widget.index;
  int count = 0;

  int num() {
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          child: const Text('+'),
          onPressed: () {
            setState(() {
              count += 1;
            });
          },
        ),
        Text(count.toString()),
        ElevatedButton(
          child: const Text('-'),
          onPressed: () {},
        ),
      ],
    );
  }
}
