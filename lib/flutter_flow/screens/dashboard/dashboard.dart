import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: InkWell(
        onTap: (){
          context.goNamed('marketplace');
        },
        child: Text('Dashboard')),);
  }
}
