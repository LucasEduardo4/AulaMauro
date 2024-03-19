import 'package:flutter/material.dart';

class Media extends StatefulWidget {
  const Media({super.key});

  @override
  State<Media> createState() => _MediaState();
}

class _MediaState extends State<Media> {
  final TextEditingController _controlaNome = TextEditingController();
  final TextEditingController _controlaNota1 = TextEditingController();
  final TextEditingController _controlaNota2 = TextEditingController();
  final TextEditingController _controlaNota3 = TextEditingController();
  final TextEditingController _controlaNota4 = TextEditingController();
  String _resultado = '';
  String aprovado = '';

  final snackBar = SnackBar(
    content: const Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  void _limpar() {}

  void _calcular() {
    double total = 0.0;
    var digitada = _controlaNota1.text.replaceAll(',', '.');
    total += double.parse(digitada);

    digitada = _controlaNota2.text.replaceAll(',', '.');
    total += double.parse(digitada);

    digitada = _controlaNota3.text.replaceAll(',', '.');
    total += double.parse(digitada);

    digitada = _controlaNota4.text.replaceAll(',', '.');
    total += double.parse(digitada);

    double media = total / 4;
    var mediaBR = '$media'.replaceAll('.', ',');

    setState(() {
      _resultado = '${_controlaNome.text} obeteve média : $mediaBR ';
    });
  }

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Média:'),
      ),
      body: Column(
        children: [
          linhaRotuloCampoTexto('Nome do Aluno:', _controlaNome),
          linhaRotuloCampoTexto('Primeria Nota:', _controlaNota1),
          linhaRotuloCampoTexto('Segunda Nota:', _controlaNota2),
          linhaRotuloCampoTexto('Terceira Nota:', _controlaNota3),
          linhaRotuloCampoTexto('Quarta Notas:', _controlaNota4),
          botao('Calcular'),
          saida(_resultado),
        ],
      ),
    );
  }

  Row saida(String mostrar) {
    return Row(
      children: [
        ScaffoldMessenger(child: Text(mostrar)),
      ],
    );
  }

  ElevatedButton botao(String texto) =>
      ElevatedButton(onPressed: _calcular, child: Text(texto));

  Row linhaRotuloCampoTexto(String rotulo, TextEditingController controlador) {
    return Row(
      children: [
        Text(rotulo),
        SizedBox(
          width: 100,
          child: TextField(
            controller: controlador,
          ),
        )
      ],
    );
  }

  Text rotulo(String texto) => Text(texto);
}
