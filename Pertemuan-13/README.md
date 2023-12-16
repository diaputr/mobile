# Pemrograman Asynchronous

* Nama  : Diah Putri Nofianti
* NIM   : 2141720054
* Absen : 12
* Kelas : TI-3A

## Praktikum 1: Mengunduh Data dari Web Service (API)

### Langkah 1: Buat project baru
Buat sebuah project flutter baru dengan nama `books`. Tambah dependensi `http` dengan mengetik perintah di terminal.
```dart
flutter pub add http
```

### Langkah 2: Cek file `pubspec.yaml`
Jika berhasil install plugin, pastikan plugin `http` telah ada di file `pubspec` seperti berikut.
```dart
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0
```

### Langkah 3: Buka file `main.dart`
```dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puput',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future'),
      ),
      body: Center(
        child: Column(children: [
          const Spacer(),
          ElevatedButton(
            child: const Text('GO!'),
            onPressed: () {},
          ),
          const Spacer(),
          isLoading ? const CircularProgressIndicator() : Text(result),
          const Spacer(),
        ]),
      ),
    );
  }
}
```

### Langkah 4: Tambah method `getData()`
```dart
  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/EoNqEAAAQBAJ';
    Uri url = Uri.https(authority, path);
    return await http.get(url);
  }
```
#### Cari judul buku favorit di Google Books, lalu ganti ID buku pada variabel path. Lalu coba akses URI di browser. Jika menampilkan data JSON, maka telah berhasil.
![Screenshot 1](images/01.jpg)

### Langkah 5: Tambah kode di `ElevatedButton`
```dart
 ElevatedButton(
            child: const Text('GO!'),
            onPressed: () {
              setState(() {
                isLoading = true;
              });
              Future.delayed(const Duration(seconds: 1)).then(((value) {
                getData().then((value) {
                  result = value.body.toString().substring(0, 450);
                  setState(() {
                    isLoading = false;
                  });
                }).catchError((e) {
                  result = "An error occured $e";
                  setState(() {
                    isLoading = false;
                  });
                });
              }));
            },
          ),          
```

#### Jelaskan terkait substring dan catchError!


### Hasil
![Screenshot 2](images/02.jpg)