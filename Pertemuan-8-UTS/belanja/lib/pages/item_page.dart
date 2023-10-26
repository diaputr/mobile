import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Hero(
            tag: 'productImage${item.name}',
            child: AspectRatio(
              aspectRatio: 1.3,
              child: Image.asset(item.img, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
              ],
            ),
          ),
        ]),
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
