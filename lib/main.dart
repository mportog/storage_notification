import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storagenotification/controllers/calendar_store.dart';
import 'package:storagenotification/controllers/firebase_user_store.dart';
import 'package:storagenotification/screens/home/calendar_reservation_view.dart';
import 'package:storagenotification/screens/login/login_page.dart';
import 'package:storagenotification/screens/cadastro/cadastro_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:storagenotification/services/app_settings.dart';

void main() {
  initializeDateFormatting('pt_BR').then((_) => runApp(FireFlutter()));
}

class FireFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseUserStore>(create: (_) => FirebaseUserStore()),
        Provider<CalendarStore>(create: (_) => CalendarStore()),
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
          title: 'FireFlutter',
          theme: AppSettings().theme(),
          initialRoute: '/',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/signup':
                return MaterialPageRoute(builder: (_) => FormCadastroPage());
              case '/login':
                return MaterialPageRoute(builder: (_) => LoginPage());
              case '/':
              default:
                return MaterialPageRoute(builder: (_) => CalendarHomePage());
            }
          },
        ),
      ),
    );
  }
}
