import 'package:flutter/material.dart';

class Kontak {
  final String nama;
  final String telepon;
  final String email;
  const Kontak(this.nama, this.telepon, this.email);
}

const daftarKontak=[
  Kontak('Muhammad Alhadiq', '0822345678', 'alhadiq@gmail.com'),
  Kontak('Bani Paimin.store', '08123456789', 'bani@gmail.com'),
  Kontak('Siska Ramadhani', '08123456789', 'siska@gmail.com'),
  Kontak('Fajar Ramadhani', '08123456789', 'fajar@gmai.com'),
  Kontak('Anaheim', '0812323453468765723746521678', 'anaheimhahaha@gmail.com')
];

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Daftar Kontak',
      theme:ThemeData(colorSchemeSeed: Colors.purple, useMaterial3: true),
      home:const KontakPage(),
    );
  }
}

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text ('Daftar Kontak')),
      body:ListView.builder(
        itemCount: daftarKontak.length,
        itemBuilder: (context,index) {
          final item=daftarKontak[index];
          return ListTile(
            leading:CircleAvatar(child: Text(item.nama[0])),
            title:Text(item.nama),
            subtitle:Text(item.telepon),
            trailing:const Icon(Icons.chevron_right),
            onTap:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder:(_)=>DetailKontak(kontak:item)),
              );
            }
          );
        }
      ),
    );
  }
}

class DetailKontak extends StatelessWidget {
  final Kontak kontak;
  const DetailKontak({super.key, required this.kontak});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text(kontak.nama)),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 40, child:Text(kontak.nama[0])),
            const SizedBox(height:16),
            Text(kontak.nama, style:const TextStyle(fontSize:24)),
            Text(kontak.telepon),
            Text(kontak.email),
            const SizedBox(height: 24),
            ElevatedButton(onPressed:()=>Navigator.pop(context), child: const Text('Kembali')),
          ],
        )
      )
    );
  }
}