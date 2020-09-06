import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:storagenotification/controllers/firebase_user_store.dart';
import 'package:storagenotification/screens/commons/drawer/custom_drawer_list_tile.dart';

class EndDrawerBase extends StatefulWidget {
  @override
  _EndDrawerBaseState createState() => _EndDrawerBaseState();
}

class _EndDrawerBaseState extends State<EndDrawerBase> {
  FirebaseUserStore _firebaseUserStore;

  @override
  void didChangeDependencies() {
    _firebaseUserStore = Provider.of<FirebaseUserStore>(context);
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
                  child: Text(_firebaseUserStore.user.name == null
                      ? 'Faça login ou cadastre-se!'
                      : 'Bem vindx ${_firebaseUserStore.user.name}!')),
              CustomDrawerListTile(
                visible: !_firebaseUserStore.isLoggedIn,
                icon: Icons.lock_outline,
                title: 'Login',
                subtitle: 'Entre com seu e-mail e senha',
                onTap: () => Navigator.of(context).pushNamed('/login'),
              ),
              CustomDrawerListTile(
                visible: !_firebaseUserStore.isLoggedIn,
                icon: Icons.person_add,
                title: 'Cadastro',
                subtitle: 'Criar novo usuário',
                onTap: () => Navigator.of(context).pushNamed('/signup'),
              ),
              CustomDrawerListTile(
                visible: _firebaseUserStore.isLoggedIn,
                icon: Icons.person,
                title: 'Conta',
                subtitle: 'Alterar dados cadastrados',
                onTap: () {},
              ),
              CustomDrawerListTile(
                visible: _firebaseUserStore.isLoggedIn,
                icon: Icons.exit_to_app,
                title: 'Sair',
                subtitle: 'Encerrar sessão no aplicativo',
                onTap: () => _firebaseUserStore.signOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
