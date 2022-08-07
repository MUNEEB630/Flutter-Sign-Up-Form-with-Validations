import 'package:flutter/material.dart';

class AppLogo extends StatefulWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Image.asset('assets/images/a.png',height: 100,
          width: 100),
    );
  }
}
