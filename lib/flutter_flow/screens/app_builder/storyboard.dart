import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoryBoard extends StatelessWidget {
  String ? path;
   StoryBoard({Key? key,this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: InkWell(
        onTap: (){
          context.pop();
        },
        child: Text(path == null ? 'App Builder > Navigation Menu > StoryBoard' : path!)));
  }
}
