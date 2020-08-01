import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './blocs/playersGameBloc.dart';

import './pages/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PlayersGameBloc>.value(
          value: PlayersGameBloc(),
        ),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    precacheImage(AssetImage("assets/icon/TapDrink.png"), context);
    precacheImage(AssetImage("assets/images/tapdrink.jpg"), context);
    precacheImage(AssetImage("assets/images/15game.jpg"), context);

    return MaterialApp(
      title: 'TapDrink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        child: WelcomePage(),
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
    );
  }
}
