import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MarketPlace extends StatelessWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: InkWell(
        onTap: (){
          context.pop();
        },
        child: Text('Dashboard > MarketPlace')));
  }
}
