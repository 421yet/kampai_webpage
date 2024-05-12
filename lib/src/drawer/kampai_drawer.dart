import 'package:flutter/material.dart';

class KampaiDrawer {
  final BuildContext context;
  const KampaiDrawer(this.context);

  NavigationDrawer builder() {
    List<TextButton> children = <TextButton>[
      TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'About');
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'About',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'Contact');
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Contact',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'Home');
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      )
    ];

    return NavigationDrawer(
      elevation: 10,
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
