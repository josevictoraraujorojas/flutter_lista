import 'package:flutter/material.dart';
import 'package:flutter_lista/model/categoria.dart';
import 'package:flutter_lista/model/produto.dart';

class PaginaCadastrarProduto extends StatefulWidget {
  const PaginaCadastrarProduto({super.key});

  @override
  State<PaginaCadastrarProduto> createState() => PaginaCadastrarProdutoStatus();
}

class PaginaCadastrarProdutoStatus extends State<PaginaCadastrarProduto> {
  final _formKey = GlobalKey<FormState>();
  Categoria? categoriaSelecionada;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController precoController = TextEditingController();

  void cadastrarProduto() {
    if (_formKey.currentState!.validate()) {
      Produto produto = Produto(
        nome: nomeController.text,
        preco: double.parse(precoController.text),
        categoria: categoriaSelecionada!,
      );

      Navigator.pop(context, produto);
    }
  }

  @override
  void dispose() {
    super.dispose();
    nomeController.dispose();
    precoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Produto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(
                  hintText: 'Informe o nome do produto',
                  prefixIcon: Icon(Icons.sell),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor informe o nome do produto';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: precoController,
                decoration: const InputDecoration(
                  hintText: 'Informe o preço do produto',
                  prefixIcon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o preço do produto';
                  }

                  final preco = double.tryParse(value.replaceAll(',', '.'));

                  if (preco == null || preco <= 0) {
                    return 'Informe um preço válido';
                  }

                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<Categoria>(
                decoration: const InputDecoration(
                  labelText: 'Categoria',
                  icon: Icon(Icons.category),
                ),
                initialValue: categoriaSelecionada,
                items: Categoria.values.map((categoria) {
                  return DropdownMenuItem<Categoria>(
                    value: categoria,
                    child: Text(categoria.name),
                  );
                }).toList(),
                onChanged: (Categoria? value) {
                  setState(() {
                    categoriaSelecionada = value;
                  });
                },
                validator: (Categoria? value) {
                  if (value == null) {
                    return 'Selecione uma categoria';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: cadastrarProduto,
                label: Text('Cadastrar'),
                icon: Icon(Icons.create),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
