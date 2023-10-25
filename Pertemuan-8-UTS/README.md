# UTS

* Nama  : Diah Putri Nofianti
* NIM   : 2141720054
* Absen : 12
* Kelas : TI-3A

## Tugas Praktikum 1: Basic Layout Flutter

## Praktikum 5: Membangun Navigasi di Flutter

### Langkah 1: Siapkan project baru
Buat sebuah project baru Flutter dengan nama `belanja`.

### Langkah 2: Mendefinisikan Route
Buatlah dua buah file dart dengan nama `home_page.dart` dan `item_page.dart` pada folder `pages`.

* `home_page.dart`
```Javascript
class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        // TODO
        throw UnimplementedError();
    }
}
```

* `item_page.dart`
```Javascript
class ItemPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        // TODO
        throw UnimplementedError();
    }
}
```

### Langkah 3: Lengkapi Kode di `main.dart`
```Javascript
import 'package:belanja/pages/home_page.dart';
import 'package:belanja/pages/item_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/item': (context) => ItemPage(),
    },
  ));
}
```

### Langkah 4: Membuat data model
Buat sebuah file dengan nama `item.dart` dan letakkan pada folder `models`.
```Javascript
class Item {
  String name;
  int price;

  Item({
    this.name,
    this.price,
  });
}
```

### Langkah 5: Lengkapi kode di class HomePage
Pada halaman `HomePage` terdapat ListView widget. Sumber data ListView diambil dari model List dari object Item.

```Javascript
class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000),
    Item(name: 'Salt', price: 2000),
  ];
}
```

### Langkah 6: Membuat ListView dan itemBuilder
Untuk menampilkan ListView pada praktikum ini digunakan itemBuilder. Data diambil dari definisi model yang telah dibuat sebelumnya.

```Javascript
body: Container(
    margin: const EdgeInsets.all(8),
    child: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (context, index) {
            final item = items[index];
            return Card(
                child: Container(
                margin: const EdgeInsets.all(8),
                    child: Row(
                        children: [
                            Expanded(child: Text(item.name)),
                            Expanded(
                                child: Text(
                                    item.price.toString(),
                                    textAlign: TextAlign.end,
                                ),
                            )
                        ],
                    ),
                ),
            ),              
        },
    ),
);
```

### Langkah 7: Menambahkan aksi pada ListView
```
return Material(
    child: InkWell(
        onTap: () {
            Navigator.pushNamed(context, '/item', arguments: item);
        },
    )
)
```

### Hasil
* `home_page.dart`
```Javascript
import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000),
    Item(name: 'Salt', price: 2000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
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
                    child: Row(
                      children: [
                        Expanded(child: Text(item.name.toString())),
                        Expanded(
                          child: Text(
                            item.price.toString(),
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
```

* `item_page.dart`
```Javascript
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('${item.name} with ${item.price}')],
        ),
      ),
    );
  }
}
```

* Shopping List
![Screenshot 1](images/01.png)

* Item Details
![Screenshot 2](images/02.png)

## Tugas Praktikum 2: 