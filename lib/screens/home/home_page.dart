import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:storagenotification/controllers/firebase_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseStore _firebaseStore;
  @override
  void didChangeDependencies() {
    _firebaseStore = Provider.of<FirebaseStore>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Observer(builder: (_) {
            if (_firebaseStore.isLoggedIn) {
              return IconButton(
                  icon: const Icon(Icons.account_circle),
                  tooltip: 'Conta',
                  onPressed: () {});
            } else {
              return IconButton(
                  icon: const Icon(Icons.exit_to_app),
                  tooltip: 'Sair',
                  onPressed: () => _firebaseStore.signOut());
            }
          })
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed('/login'),
              child: const Text('Login')),
          RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed('/signup'),
              child: const Text('Cadastro')),
          SignInButton(
            Buttons.Facebook,
            text: 'Entar com Facebook',
            onPressed: () {},
          ),
          SignInButton(
            Buttons.GitHub,
            text: "Entrar com GitHub",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
