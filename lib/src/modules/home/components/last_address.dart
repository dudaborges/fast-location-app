import 'package:flutter/material.dart';
import 'package:app_fast_location/src/modules/home/model/cep_model.dart';

class LastAddress extends StatelessWidget {
  final CepModel? address;

  LastAddress({this.address});

  @override
  Widget build(BuildContext context) {
    if (address == null) return Container();

    return ListTile(
      title: Text('${address!.logradouro}, ${address!.bairro}'),
      subtitle: Text('${address!.cidade} - ${address!.uf}, ${address!.cep}'),
    );
  }
}
