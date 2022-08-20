import 'package:fale_mais_flutter/resources/constants/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  MyRouter();

  late final router = GoRouter(
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
        name: rootRouteName,
        path: '/',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const HomePage(),
        ),
      ),
    ],

    // If no route was found or there's an error
    // at the parameters
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: Scaffold(
        body: Center(child: Text(state.error.toString())),
      ),
    ),
  );
}
