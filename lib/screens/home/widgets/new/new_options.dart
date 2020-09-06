import 'package:flutter/material.dart';
import 'package:storagenotification/screens/home/widgets/custom_list_tile.dart';

class BuildOptionReservation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        CustomListTile(Icons.camera_alt, const Text('Leitura QrCode'),
            subtitle: const Text('Nova reserva no local'), onTap: () {}),
        CustomListTile(Icons.map, const Text('Escolher no mapa'),
            subtitle: const Text('Nova reserva à distância'), onTap: () {}),
        CustomListTile(Icons.filter_list, const Text('Busca com filtro'),
            subtitle: const Text('Pesquisar assets para reserva'),
            onTap: () {}),
      ],
    );
  }
}
