import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/features/datails/datails_screen.dart';
import 'package:smart_home/features/datails/model/model.dart';
import 'package:smart_home/features/home/homescreen.dart';
import 'package:smart_home/features/navigation/navigation.dart';
import 'package:smart_home/router/router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: Routes.navigaiton.path,
    name: Routes.navigaiton.name,
    pageBuilder: (context, state) {
      return const CupertinoPage(child: Navigation());
    },
  ),
  GoRoute(
    path: Routes.detailsscreen.path,
    name: Routes.detailsscreen.name,
    pageBuilder: (context, state) {
      return  CupertinoPage(child: DetailsScreen(model: state.extra as CustompageModel,));
    },
  ),
   GoRoute(
    path: Routes.homescreen.path,
    name: Routes.homescreen.name,
    pageBuilder: (context, state) {
      return  const CupertinoPage(child: HomeScreenView());
    },
  ),
]);
