import 'package:flutter/material.dart';
import 'package:flutter_lista/model/categoria.dart';
import 'package:flutter_lista/model/produto.dart';
import 'package:flutter_lista/view/card_produto.dart';
import 'package:flutter_lista/view/pagina_cadastrar_produto.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => PaginaPrincipalStatus();
}

class PaginaPrincipalStatus extends State<PaginaPrincipal> {
  List<Produto> lista = [
    Produto(
      nome: 'Computador',
      preco: 3000.00,
      categoria: Categoria.eletronicos,
    ),
    Produto(nome: 'Calça', preco: 30.00, categoria: Categoria.roupas),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Produtos')),
      body: Center(
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (BuildContext context, int indice) {
            return CardProduto(produto: lista[indice]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Produto? produto = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaginaCadastrarProduto()),
          );

          if (produto != null) {
            setState(() {
              lista.add(produto);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
