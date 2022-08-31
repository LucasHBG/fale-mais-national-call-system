import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '/router/routes.dart';
import 'firebase_options.dart';
import 'resources/app_context_extension.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runZonedGuarded<Future<void>>(
    () async {
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      runApp(const MyApp());
    },
    (error, stackTrace) async {
      //Verifies if your applications is in debug mode
      if (kDebugMode) {
        print('Caught Dart Error!');
        print('$error');
        print('$stackTrace');
      }
    },
  );

  //Catch plataform especific errors and shows them
  FlutterError.onError = (FlutterErrorDetails details) async {
    final dynamic exception = details.exception;
    final StackTrace? stackTrace = details.stack;

    if (kDebugMode) {
      print('Caught Framework Error!');
      //In development mode simply print to console
      FlutterError.dumpErrorToConsole(details);
    } else {
      //In production mode report to the application zone
      Zone.current.handleUncaughtError(exception, stackTrace!);
    }
  };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          lazy: false,
          create: (BuildContext createContext) => MyRouter(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final GoRouter router =
              Provider.of<MyRouter>(context, listen: false).router;
          return MaterialApp.router(
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            routeInformationProvider: router.routeInformationProvider,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Roboto',
              scaffoldBackgroundColor: context.resources.color.colorBackground,
              backgroundColor: context.resources.color.colorBackground,
              canvasColor: context.resources.color.colorBackground,
              cardColor: context.resources.color.colorNeutral,
              textTheme: Theme.of(context).textTheme.apply(
                    displayColor: context.resources.color.colorPrimaryText,
                    bodyColor: context.resources.color.colorPrimaryText,
                  ),
            ),
          );
        },
      ),
    );
  }
}
