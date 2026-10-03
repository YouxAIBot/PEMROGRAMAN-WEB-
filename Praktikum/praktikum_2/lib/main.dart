//Langkah A
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Praktikum 2',
//       theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
//       home: const ProfilePage(),
//     );
//   }
// }
//
// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Profil')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.blue.shade50,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             children: [
//               const CircleAvatar(
//                 radius: 32,
//                 child: Icon(Icons.person, size: 32),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: const [
//                     Text(
//                       'Firaas Ferdinal',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text('20240801011'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



//LANGKAH BAGIAN B
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Praktikum 2',
//       theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
//       home: const MenuPage(),
//     );
//   }
// }
//
// class Makanan {
//   final String nama;
//   final int harga;
//   const Makanan(this.nama, this.harga);
// }
//
// const daftarMenu = [
//   Makanan('Nasi Goreng', 15000),
//   Makanan('Mie Ayam', 12000),
//   Makanan('Es Teh', 4000),
//   Makanan('Ayam Bakar', 20000),
// ];
//
// class MenuPage extends StatelessWidget {
//   const MenuPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Daftar Menu')),
//       body: ListView.builder(
//         itemCount: daftarMenu.length,
//         itemBuilder: (context, index) {
//           final item = daftarMenu[index];
//           return Card(
//             margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             child: ListTile(
//               leading: const Icon(Icons.restaurant),
//               title: Text(item.nama),
//               subtitle: Text('Rp ${item.harga}'),
//               trailing: const Icon(Icons.chevron_right),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



//LANGKAH BAGIAN C
// import 'package:flutter/material.dart';
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Praktikum 2',
//       theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
//       home: const MenuPage(),
//     );
//   }
// }
//
// class Makanan {
//   final String nama;
//   final int harga;
//   const Makanan(this.nama, this.harga);
// }
//
// const daftarMenu = [
//   Makanan('Nasi Goreng', 15000),
//   Makanan('Mie Ayam', 12000),
//   Makanan('Es Teh', 4000),
//   Makanan('Ayam Bakar', 20000),
// ];
//
// class MenuPage extends StatelessWidget {
//   const MenuPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Daftar Menu')),
//       body: ListView.builder(
//         itemCount: daftarMenu.length,
//         itemBuilder: (context, index) {
//           final item = daftarMenu[index];
//           return Card(
//             margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             child: ListTile(
//               leading: const Icon(Icons.restaurant),
//               title: Text(item.nama),
//               subtitle: Text('Rp ${item.harga}'),
//               trailing: const Icon(Icons.chevron_right),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => DetailPage(makanan: item)),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class DetailPage extends StatelessWidget {
//   final Makanan makanan;
//   const DetailPage({super.key, required this.makanan});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title:  Text(makanan.nama)),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.restaurant_menu, size: 80),
//             const SizedBox(height: 16),
//             Text(makanan.nama, style: const TextStyle(fontSize: 24)),
//             Text('Rp ${makanan.harga}'),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Kembali'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


//LATIHAN MANDIRI
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum 2 - Latihan Mandiri',
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const MenuPage(),
    );
  }
}

class Makanan {
  final String nama;
  final int harga;
  final String deskripsi; // Properti baru

  const Makanan(this.nama, this.harga, this.deskripsi);
}

const daftarMenu = [
  Makanan('Nasi Goreng', 15000, 'Nasi goreng spesial dengan telur dan ayam suwir.'),
  Makanan('Mie Ayam', 12000, 'Mie ayam lezat dengan pangsit renyah.'),
  Makanan('Es Teh', 4000, 'Minuman es teh manis yang menyegarkan.'),
  Makanan('Ayam Bakar', 20000, 'Ayam bakar bumbu kecap meresap dengan lalapan.'),
  Makanan('Sate Ayam', 18000, 'Sate ayam bumbu kacang khas madura (Menu Baru).'),
  Makanan('Bakso Sapi', 16000, 'Bakso sapi kenyal dengan kuah kaldu hangat (Menu Baru).'),
  Makanan('Jus Alpukat', 8000, 'Jus alpukat segar dengan kental manis cokelat (Menu Baru).'),
];

String formatRibuan(int nilai) {
  String str = nilai.toString();
  String hasil = '';
  int counter = 0;
  for (int i = str.length - 1; i >= 0; i--) {
    hasil = str[i] + hasil;
    counter++;
    if (counter == 3 && i != 0) {
      hasil = '.' + hasil;
      counter = 0;
    }
  }
  return hasil;
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Menu')),
      body: ListView.builder(
        itemCount: daftarMenu.length,
        itemBuilder: (context, index) {
          final item = daftarMenu[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.shade100),
            ),
            child: ListTile(
              leading: const Icon(Icons.restaurant, color: Colors.blue),
              title: Text(item.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Rp ${formatRibuan(item.harga)}'),
              trailing: const Icon(Icons.chevron_right, color: Colors.blue),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetailPage(makanan: item)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Makanan makanan;
  const DetailPage({super.key, required this.makanan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(makanan.nama)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.restaurant_menu, size: 80, color: Colors.blue),
              const SizedBox(height: 16),
              Text(
                makanan.nama,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Rp ${formatRibuan(makanan.harga)}',
                style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 16),
              Text(
                makanan.deskripsi,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
