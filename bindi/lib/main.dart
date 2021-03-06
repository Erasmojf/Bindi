import 'package:bindi/screens/base/base_screen.dart';
import 'package:bindi/stores/category_store.dart';
import 'package:bindi/stores/connectivity_store.dart';
import 'package:bindi/stores/favorite_store.dart';
import 'package:bindi/stores/home_store.dart';
import 'package:bindi/stores/page_store.dart';
import 'package:bindi/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(ConnectivityStore());
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(CategoryStore());
  GetIt.I.registerSingleton(FavoriteStore());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    'UAfA9SZ5MeuoNNdcNnA1aDfQy3iOhdd3wH6ScqNj',
    'https://parseapi.back4app.com/',
    clientKey: 'XV3H7c7QjuEo1OmwJUvU7Alo4lR5k8N7twPjlTn5',
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bindi',
      theme: ThemeData(
        primaryColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        cursorColor: Colors.orange,
      ),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      home: BaseScreen(),
    );
  }
}
