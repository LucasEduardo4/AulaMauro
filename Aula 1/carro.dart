class Carro {
  int _portas = 0;
  String _cor = 'branco';

  Carro(String cor, int portas) {
    _cor = cor;
    _portas = portas;
  }

  String resumo() {
    return 'Meu carro é $_cor e tem $_portas portas';
  }
}
