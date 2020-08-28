import 'package:flutter/material.dart';
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
            elevation: 0,
            automaticallyImplyLeading: false,
            title: const Text('Entrar'),
            centerTitle: true),
        body: Form(
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
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
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                            onPressed: () {},
                            child: Text('Esqueci minha senha',
                                style: TextStyle(color: Colors.grey))),
                        RaisedButton(
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
                        RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          textColor: Colors.grey,
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/signup');
                          },
                          child: const Text('CADASTRAR'),
                        )
                      ]))
            ])));
  }
}
