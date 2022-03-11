import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String? texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto,
      this.quandoSelecionado); //tem que colocar uma função como parametro, aí no caso o que vai retornar é com a outra função, essa aqui é só o parametro

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      width: double.infinity,
      child: ElevatedButton(
        child: Text(texto!),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
