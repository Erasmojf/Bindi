import 'package:bindi/screens/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  runApp(MyApp());


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
        primarySwatch: Colors.blue,
      ),
      home: BaseScreen(),
    );
  }
}


