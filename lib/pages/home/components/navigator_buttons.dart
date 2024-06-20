import 'package:flutter/material.dart';

class NavigatorButton extends StatelessWidget {
  final String route;
  const NavigatorButton({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Text('go to $route page'),
    );
  }
}
