import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_practice/screens/app_builder/app_builder.dart';
import 'package:navigation_practice/screens/app_builder/storyboard.dart';
import 'package:navigation_practice/screens/dashboard/dashboard.dart';
import 'package:navigation_practice/screens/dashboard/marketplace.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  GoRouter goRouter = GoRouter(
      initialLocation: '/dashboard',
      routes: [
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
              name: 'dashboard',
              path: '/dashboard',
              builder: (context, state) {
                return DashBoard();
              },
              routes: [
                GoRoute(
                  name: 'marketplace',
                  path: 'marketplace',
                  builder: (context, state) {
                    return MarketPlace();
                  },
                )
              ])
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              name: 'app_builder',
              path: '/app_builder',
              builder: (context, state) {
                return AppBuilder();
              },
              routes: [
                GoRoute(
                  name: 'storyboard',
                  path: 'storyboard',
                  builder: (context, state) {
                    return StoryBoard(path: 'App Builder > Storyboard',);
                  },
                )
              ])
        ]),

      ],
      builder: (context, state, navigationShell) {
        return MyHomePage(child: navigationShell);
      },
    )
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      routerConfig: goRouter,
    );
  }
}

class MyHomePage extends StatefulWidget {
  StatefulNavigationShell child;
  MyHomePage({Key? key, required this.child}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize_outlined), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.android), label: 'App Builder'),
        ],
        currentIndex: widget.child.currentIndex,
        onTap: (int index) {
          widget.child.goBranch(index, initialLocation: index == widget.child.currentIndex);
        },
      ),
    );
  }
}
