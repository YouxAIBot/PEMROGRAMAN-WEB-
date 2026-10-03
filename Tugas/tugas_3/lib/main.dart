import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BelanjaModel(),
      child: const MyApp(),
    ),
  );
}

class Barang {
  String nama;
  int jumlah;
  String kategori;
  bool sudahDibeli;

  Barang({
    required this.nama,
    required this.jumlah,
    required this.kategori,
    this.sudahDibeli = false,
  });
}

class BelanjaModel extends ChangeNotifier {
  final List<Barang> _items = [];

  List<Barang> get items => List.unmodifiable(_items);

  int get jumlahBelumDibeli =>
      _items.where((barang) => !barang.sudahDibeli).length;

  void tambahBarang({
    required String nama,
    required int jumlah,
    required String kategori,
  }) {
    _items.add(
      Barang(
        nama: nama,
        jumlah: jumlah,
        kategori: kategori,
      ),
    );

    notifyListeners();
  }

  void toggleDibeli(int index) {
    _items[index].sudahDibeli = !_items[index].sudahDibeli;
    notifyListeners();
  }

  void hapusBarang(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Belanja',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const DaftarPage(),
    );
  }
}

class DaftarPage extends StatelessWidget {
  const DaftarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<BelanjaModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Belanja (${model.jumlahBelumDibeli} belum dibeli)',
        ),
      ),
      body: model.items.isEmpty
          ? const Center(
        child: Text(
          'Belum ada barang',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: model.items.length,
        itemBuilder: (context, index) {
          final barang = model.items[index];

          return ListTile(
            leading: Checkbox(
              value: barang.sudahDibeli,
              onChanged: (_) {
                context.read<BelanjaModel>().toggleDibeli(index);
              },
            ),
            title: Text(
              barang.nama,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: barang.sudahDibeli
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
            subtitle: Text(
              'Jumlah: ${barang.jumlah} • Kategori: ${barang.kategori}',
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<BelanjaModel>().hapusBarang(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const TambahBarangPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TambahBarangPage extends StatefulWidget {
  const TambahBarangPage({super.key});

  @override
  State<TambahBarangPage> createState() => _TambahBarangPageState();
}

class _TambahBarangPageState extends State<TambahBarangPage> {
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _jumlahController = TextEditingController();

  String? _kategori;

  final List<String> _kategoriList = [
    'Makanan',
    'Minuman',
    'Kebutuhan Rumah',
    'Elektronik',
    'Lainnya',
  ];

  @override
  void dispose() {
    _namaController.dispose();
    _jumlahController.dispose();
    super.dispose();
  }

  void _simpanBarang() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final nama = _namaController.text.trim();
    final jumlah = int.parse(_jumlahController.text.trim());
    final kategori = _kategori!;

    context.read<BelanjaModel>().tambahBarang(
      nama: nama,
      jumlah: jumlah,
      kategori: kategori,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Barang'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // NAMA BARANG
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama barang',
                hintText: 'Contoh: Beras',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nama barang wajib diisi';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: _jumlahController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jumlah',
                hintText: 'Contoh: 2',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Jumlah wajib diisi';
                }

                final jumlah = int.tryParse(value.trim());

                if (jumlah == null) {
                  return 'Jumlah harus berupa angka';
                }

                if (jumlah <= 0) {
                  return 'Jumlah harus lebih dari 0';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: _kategori,
              decoration: const InputDecoration(
                labelText: 'Kategori',
                border: OutlineInputBorder(),
              ),
              items: _kategoriList.map((kategori) {
                return DropdownMenuItem(
                  value: kategori,
                  child: Text(kategori),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _kategori = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Kategori wajib dipilih';
                }

                return null;
              },
            ),

            const SizedBox(height: 24),

            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _simpanBarang,
                child: const Text(
                  'Simpan Barang',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}