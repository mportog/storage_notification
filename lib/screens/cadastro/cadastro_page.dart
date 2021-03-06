import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storagenotification/controllers/firebase_user_store.dart';
import 'package:storagenotification/helpers/helper_widgets.dart';
import 'package:storagenotification/helpers/validators.dart';
import 'package:storagenotification/models/user.dart';
import 'package:storagenotification/screens/cadastro/widget/input_form_field.dart';

class FormCadastroPage extends StatefulWidget {
  @override
  _FormCadastroPageState createState() => _FormCadastroPageState();
}

class _FormCadastroPageState extends State<FormCadastroPage> with WidgetHelper {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final User user = User();
  FirebaseUserStore _firebaseUserStore;
  @override
  void didChangeDependencies() {
    _firebaseUserStore = Provider.of<FirebaseUserStore>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 5,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(true),
            tooltip: 'Cancelar',
          )
        ],
        title: const Text('Cadastrar'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            children: <Widget>[
              const SizedBox(height: 10),
              InputForm(
                  validator: (name) => nameValid(name),
                  keyboardType: TextInputType.text,
                  label: 'Nome completo:',
                  onSaved: (value) => user.name = value),
              const SizedBox(height: 20),
              InputForm(
                  validator: (email) {
                    if (email.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    if (!emailValid(email)) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                  onSaved: (value) => user.email = value,
                  keyboardType: TextInputType.text,
                  label: 'E-mail:'),
              const SizedBox(height: 20),
              InputForm(
                obscureText: true,
                validator: (pass) {
                  if (pass.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  if (pass.length < 6) {
                    return 'Senha deve conter pelo menos 6 dígitos';
                  }
                  return null;
                },
                onSaved: (value) => user.password = value,
                keyboardType: TextInputType.text,
                label: 'Senha:',
              ),
              const SizedBox(height: 20),
              InputForm(
                obscureText: true,
                validator: (pass) {
                  if (pass.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  if (pass.length < 6) {
                    return 'Senha deve conter pelo menos 6 dígitos';
                  }

                  return null;
                },
                onSaved: (value) => user.confirmPassword = value,
                keyboardType: TextInputType.text,
                label: 'Confirmar senha:',
              ),
              const SizedBox(height: 35),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    if (user.password != user.confirmPassword) {
                      scaffoldKey.currentState.showSnackBar(const SnackBar(
                        content: Text('Senhas não correspondem'),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      _firebaseUserStore
                          .signUp(
                              user: user,
                              onFail: (e) {
                                scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text('Falha ao entrar: $e'),
                                  backgroundColor: Colors.red,
                                ));
                              },
                              onSuccess: () {
                                scaffoldKey.currentState
                                    .showSnackBar(const SnackBar(
                                  content: Text('Cadastrado com sucesso'),
                                  backgroundColor: Colors.green,
                                ));
                              })
                          .then((value) =>
                              Future.delayed(const Duration(seconds: 1)))
                          .then((value) => Navigator.of(context).pop(true));
                    }
                  }
                },
                color: Colors.indigoAccent,
                child:
                    Text('CRIAR CONTA', style: TextStyle(color: Colors.white)),
              ),
            ]),
      ),
    );
  }
}
