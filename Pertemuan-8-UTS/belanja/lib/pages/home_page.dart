import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000, img: 'gula.png', stock: 10, rating: 4.5),
    Item(name: 'Salt', price: 2000, img: 'garam.png', stock: 5, rating: 3.5),
    Item(name: 'Rice', price: 10000, img: 'beras.png', stock: 3, rating: 5.0),
    Item(name: 'Egg', price: 2000, img: 'telur.png', stock: 20, rating: 4.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: GridView.builder(
        gridDelegate: (const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.9)),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Material(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Card(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: Column(children: [
                    Expanded(
                      child: Hero(
                        tag: item.name,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(item.img, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Row(children: [
                      Expanded(child: Text(item.name.toString())),
                      Expanded(
                        child: Text(
                          'Rp. ' + item.price.toString(),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ]),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.red[500],
                        ),
                        Text(item.rating.toString()),
                        Expanded(
                          child: Text(
                            'Stock: ' + item.stock.toString(),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: const Row(
            children: [
              Text(
                'Diah Putri Nofianti | 2141720054',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
