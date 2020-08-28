import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FormCadastroPage extends StatefulWidget {
  @override
  _FormCadastroPageState createState() => _FormCadastroPageState();
}

class _FormCadastroPageState extends State<FormCadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 5,
        title: const Text('Cadastro: Pessoal'),
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          children: <Widget>[
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                  labelText: 'CPF ou CNPJ:',
                  prefix: Icon(Icons.assignment_ind)),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: 'Nome completo:', prefix: Icon(Icons.person)),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: '(XX) 9 4402-8922',
                  labelText: 'Celular:',
                  prefix: Icon(Icons.phone_android)),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                  hintText: 'dd/MM/aaaa',
                  labelText: 'Data de nascimento:',
                  prefix: Icon(Icons.event)),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'E-mail:', prefix: Icon(Icons.mail)),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'Confirmar e-mail:',
                  prefix: Icon(Icons.contact_mail)),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Senha:', prefix: Icon(Icons.lock)),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: ' tamanho minimo 6',
                  labelText: 'Confirmar senha:',
                  prefix: Icon(Icons.lock_outline)),
            ),
            const SizedBox(height: 35),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Observer(
                    builder: (_) => RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      onPressed: () {},
                      color: Colors.indigoAccent,
                      child: Center(
                          child: Text('CONTINUAR',
                              style: TextStyle(color: Colors.white))),
                    ),
                  ),
                ]),
          ]),
    );
  }
}
