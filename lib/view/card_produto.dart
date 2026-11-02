import 'package:flutter/material.dart';
import 'package:flutter_lista/model/categoria.dart';
import 'package:flutter_lista/model/produto.dart';

class CardProduto extends StatelessWidget {
  final Produto produto;

  const CardProduto({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Produto adicionado ao carrinho!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue.shade50,
                child: Icon(obterIcone(), color: Colors.blue),
              ),

              SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      produto.nome,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      produto.categoria.name,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              Text(
                'R\$ ${produto.preco.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData obterIcone() {
    switch (produto.categoria) {
      case Categoria.eletronicos:
        return Icons.computer;

      case Categoria.moveis:
        return Icons.chair;

      case Categoria.comidas:
        return Icons.restaurant;

      case Categoria.roupas:
        return Icons.checkroom;
    }
  }
}
