import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:storagenotification/controllers/firebase_store.dart';
import 'package:storagenotification/screens/commons/drawer/custom_drawer_list_tile.dart';

class EndDrawerBase extends StatefulWidget {
  @override
  _EndDrawerBaseState createState() => _EndDrawerBaseState();
}

class _EndDrawerBaseState extends State<EndDrawerBase> {
  FirebaseStore _firebaseStore;

  @override
  void didChangeDependencies() {
    _firebaseStore = Provider.of<FirebaseStore>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Observer(
          builder: (_) => ListView(
            children: <Widget>[
              DrawerHeader(
                  child: Text(_firebaseStore.user.name == null
                      ? 'Faça login ou cadastre-se!'
                      : 'Bem vindx ${_firebaseStore.user.name}!')),
              CustomDrawerListTile(
                visible: !_firebaseStore.isLoggedIn,
                icon: Icons.lock_outline,
                title: 'Login',
                subtitle: 'Entre com seu e-mail e senha',
                onTap: () => Navigator.of(context).pushNamed('/login'),
              ),
              CustomDrawerListTile(
                visible: !_firebaseStore.isLoggedIn,
                icon: Icons.person_add,
                title: 'Cadastro',
                subtitle: 'Criar novo usuário',
                onTap: () => Navigator.of(context).pushNamed('/signup'),
              ),
              CustomDrawerListTile(
                visible: _firebaseStore.isLoggedIn,
                icon: Icons.person,
                title: 'Conta',
                subtitle: 'Alterar dados cadastrados',
                onTap: () {},
              ),
              CustomDrawerListTile(
                visible: _firebaseStore.isLoggedIn,
                icon: Icons.exit_to_app,
                title: 'Sair',
                subtitle: 'Encerrar sessão no aplicativo',
                onTap: () => _firebaseStore.signOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
