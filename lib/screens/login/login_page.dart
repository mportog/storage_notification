import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:storagenotification/helpers/validators.dart';
import 'package:storagenotification/screens/login/widget/login_background.dart';
import 'package:storagenotification/models/user.dart';
import 'package:storagenotification/controllers/firebase_store.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseStore _firebaseStore;

  @override
  void didChangeDependencies() {
    _firebaseStore = Provider.of<FirebaseStore>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Observer(
              builder: (_) => _firebaseStore.onlyEmail
                  ? const Text('Reset de senha')
                  : const Text('Entrar')),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                tooltip: 'Cancelar',
                onPressed: () => Navigator.of(context).pop(true))
          ],
        ),
        body: Observer(
          builder: (_) => Form(
              key: formKey,
              child: ListView(shrinkWrap: true, children: <Widget>[
                Background(MediaQuery.of(context).size.height * 0.45,
                    MediaQuery.of(context).size.width),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    controller: emailController,
                    validator: (email) {
                      if (!emailValid(email)) return 'E-mail inválido';
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'E-mail', hintText: 'E-mail'),
                  ),
                ),
                Visibility(
                  visible: !_firebaseStore.onlyEmail,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 25),
                    child: TextFormField(
                      autocorrect: false,
                      obscureText: true,
                      controller: passController,
                      validator: (pass) {
                        if (pass.isEmpty || pass.length < 6) {
                          return 'Senha inválida';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Senha', hintText: 'Senha'),
                    ),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                _firebaseStore.resetPassword(
                                    mail: emailController.text,
                                    onFail: (e) {
                                      scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        content: Text('Falha ao entrar: $e'),
                                        backgroundColor: Colors.yellow[600],
                                      ));
                                    },
                                    onSuccess: () {
                                      scaffoldKey.currentState
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            'E-mail de recuperação enviado com sucesso'),
                                        backgroundColor: Colors.blue,
                                      ));
                                    });
                              },
                              child: Text('Esqueci minha senha',
                                  style: TextStyle(color: Colors.grey))),
                          Visibility(
                            visible: !_firebaseStore.onlyEmail,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  _firebaseStore.signIn(
                                      user: User(
                                          email: emailController.text,
                                          password: passController.text),
                                      onFail: (e) {
                                        scaffoldKey.currentState
                                            .showSnackBar(SnackBar(
                                          content: Text('Falha ao entrar: $e'),
                                          backgroundColor: Colors.red,
                                        ));
                                      },
                                      onSuccess: () {
                                        scaffoldKey.currentState
                                            .showSnackBar(const SnackBar(
                                          content: Text('Logado com sucesso'),
                                          backgroundColor: Colors.green,
                                        ));
                                        Future.delayed(
                                                const Duration(seconds: 1))
                                            .then((value) =>
                                                Navigator.of(context)
                                                    .pop(true));
                                      });
                                }
                              },
                              color: Colors.indigoAccent,
                              child: Center(
                                  child: Text('Entrar'.toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                          Visibility(
                            visible: !_firebaseStore.onlyEmail,
                            child: RaisedButton(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              textColor: Colors.grey,
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/signup');
                              },
                              child: const Text('CADASTRAR'),
                            ),
                          )
                        ]))
              ])),
        ));
  }
}
