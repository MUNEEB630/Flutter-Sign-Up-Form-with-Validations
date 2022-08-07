import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({Key? key, required this.pass}) : super(key: key);

  final String pass;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: Center(child:Text('hello $pass')),

);
}
}

