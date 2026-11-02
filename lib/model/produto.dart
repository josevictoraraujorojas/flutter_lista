import 'package:flutter_lista/model/categoria.dart';

class Produto {
  String _nome;
  double _preco;
  Categoria _categoria;

  Produto({
    required String nome,
    required double preco,
    required Categoria categoria,
  }) : _nome = nome,
       _preco = preco,
       _categoria = categoria;

  String get nome => _nome;
  double get preco => _preco;
  Categoria get categoria => _categoria;
}
