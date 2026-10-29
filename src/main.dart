import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto JM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categorias = ['Todos', 'Clássicos', 'Frutados', 'Sem álcool', 'Shots'];
    final drinks = [
      {'nome': 'Caipirinha', 'desc': 'Cachaça, limão, açúcar e gelo'},
      {'nome': 'Mojito', 'desc': 'Rum, hortelã, limão e água com gás'},
      {'nome': 'Margarita', 'desc': 'Tequila, licor de laranja e limão'},
      {'nome': 'Piña Colada', 'desc': 'Rum, leite de coco e abacaxi'},
      {'nome': 'Negroni', 'desc': 'Gin, Campari e vermute rosso'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projeto JM - Drinks'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Encontre seu drink',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Pesquisar drink...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categorias.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) => Chip(label: Text(categorias[i])),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Populares',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: drinks.length,
                itemBuilder: (_, i) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.local_bar, size: 36),
                    title: Text(drinks[i]['nome']!),
                    subtitle: Text(drinks[i]['desc']!),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}