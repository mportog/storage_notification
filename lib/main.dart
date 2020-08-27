import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:storagenotification/login_page.dart';

Future<void> main() async {
  runApp(MyApp());
  //criar dados no documento especifico:
  Firestore.instance
      .collection('teste')
      .document('primeiro')
      .setData({'teste4': 'tested pass'});

  //atualizar um dado especifico de um documento:
  Firestore.instance
      .collection('teste')
      .document('primeiro')
      .updateData({'teste1': 'data de Teste'});

//para apenas 01 documento:
  DocumentSnapshot doc =
      await Firestore.instance.collection('teste').document('primeiro').get();
  print('Snapshot 01 doc:');
  print(doc.data);

  //um dado deste documento (map):
  print('Snapshot 01 dado do doc:');
  print(doc.data['teste1']);

  //observar alterações em tempo real e retornar atualização:
  Firestore.instance
      .collection('teste')
      .document('primeiro')
      .snapshots()
      .listen((event) {
    print('Updated:');
    print(event.data);
  });

  //retornar TODOS os documentos de uma coleção:
  QuerySnapshot querySnap =
      await Firestore.instance.collection('teste').getDocuments();
  print('dados de cada doc da col:');
  for (DocumentSnapshot documentSnapshot in querySnap.documents)
    print(documentSnapshot.data);

  //respota de funcao do servidor
  final response = await CloudFunctions.instance
      .getHttpsCallable(functionName: 'helloWorld')
      .call();
  print(response.data);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}
