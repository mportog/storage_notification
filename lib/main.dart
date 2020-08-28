import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storagenotification/controllers/firebase_store.dart';
import 'package:storagenotification/controllers/user_store.dart';
import 'package:storagenotification/screens/login/login_page.dart';

import 'screens/cadastro/cadastro_page.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseStore>(create: (_) => FirebaseStore()),
        Provider<UserStore>(create: (_) => UserStore()),
      ],
      child: GestureDetector(
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild.unfocus();
          }
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            splashColor: Colors.indigo,
            appBarTheme: AppBarTheme(color: Colors.indigo),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/login',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/signup':
                return MaterialPageRoute(builder: (_) => FormCadastroPage());
              case '/login':
              default:
                return MaterialPageRoute(builder: (_) => LoginPage());
            }
          },
        ),
      ),
    );
  }
}
