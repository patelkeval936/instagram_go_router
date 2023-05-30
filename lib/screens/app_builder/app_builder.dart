import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBuilder extends StatelessWidget {
  const AppBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: InkWell(
        onTap: (){
          context.goNamed('storyboard');
        },
        child: Text(' App Builder')),);
  }
}
