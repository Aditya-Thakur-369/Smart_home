import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/router/router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: Routes.navigaiton.path,
    name: Routes.navigaiton.name,
    pageBuilder: (context, state) {
      return const CupertinoPage(child: Text("Hello World"));
    },
  ),
]);
