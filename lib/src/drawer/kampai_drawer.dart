import 'package:flutter/material.dart';

class KampaiDrawer {
  final BuildContext context;
  const KampaiDrawer(this.context);

  NavigationDrawer builder() {
    List<TextButton> children = <TextButton>[
      TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/About');
        },
        child: const Text('About'),
      ),
      TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/Contact');
        },
        child: const Text('Contact'),
      ),
      TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/Home');
        },
        child: const Text('Home'),
      )
    ];

    return NavigationDrawer(
      children: <Widget>[
        const DrawerHeader(
          child: Text(
            'c.1984',
            style: TextStyle(fontWeight: FontWeight.w100),
            textAlign: TextAlign.right,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          // padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: children[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(indent: 8, endIndent: 8),
          itemCount: children.length,
        )
      ],
    );
  }
}
