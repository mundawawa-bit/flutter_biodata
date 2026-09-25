// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

void main() {
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Biodata(),
    );
  }
}

class Biodata extends StatefulWidget {
  const Biodata({super.key});

  @override
  State<Biodata> createState() => _BiodataState();
}

class _BiodataState extends State<Biodata> {
  TextEditingController nama = TextEditingController();
  TextEditingController npm = TextEditingController();
  TextEditingController jurusan = TextEditingController();
  TextEditingController tempatLahir = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();

  bool sudahDisimpan = false;


  // simpan data
  void simpanData() {
    if (nama.text.isEmpty || npm.text.isEmpty || jurusan.text.isEmpty || tempatLahir.text.isEmpty || tanggalLahir.text.isEmpty) {
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: const Text('Data Belum Lengkap'),
            content: const Text(
              'Lengkapi data terlebih dahulu',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        }
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Data belum lengkap!'),
      //   ),
      // );
    } else {
      setState(() {
        sudahDisimpan = true;
      });

      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: const Text('Data berhasil disimpan.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  //Edit data
    void editData() {
      setState(() {
        sudahDisimpan = false;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Biodata Mahasiswa'),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),

        child: Column(
          children: [
            //foto profil
            CircleAvatar(
              radius: 60,
              backgroundImage: const AssetImage('assets/foto.jpg'),
              //   foto != null ? FileImage(foto!) : null,
              // child: foto == null ? const Icon(Icons.person, size: 60) : null,
            ),

            // ElevatedButton(onPressed: pilihFoto, 
            //   child: const Text('Pilih Foto')
            // ),

            // Nama
            TextField(
              controller : nama,
              decoration: const InputDecoration(
                labelText: 'Nama',
              ),
            ),

            // NPM
            TextField(
              controller: npm,
              decoration: const InputDecoration(
                labelText: 'NPM',
              ),
            ),

            //Jurusan
            TextField(
              controller: jurusan,
              decoration: const InputDecoration(
                labelText: 'Jurusan',
              ),
            ),

            //Tempat Lahir
            TextField(
              controller: tempatLahir,
              decoration: const InputDecoration(
                labelText: 'Tempat Lahir',
              ),
            ),

            //Tanggal Lahir
            TextField(
              controller: tanggalLahir,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Tanggal Lahir',
              ),
              onTap: () async {
                DateTime? tanggal = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000),
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now()
                );

                if (tanggal != null) {
                  setState(() {
                    tanggalLahir.text =
                      '${tanggal.day}-${tanggal.month}-${tanggal.year}';
                  });
                }
              }
            ),

            const SizedBox(height: 20),

            //Tombol simpan
            ElevatedButton(
              onPressed: sudahDisimpan ? editData : simpanData,
              child: Text(
                sudahDisimpan ? 'Edit Data' : 'Simpan Data',
              ),
            ),

            const SizedBox(height: 20),

            //nampilin data
            // if (sudahDisimpan)
            //   Column(
            //     children: [
            //       const Text(
            //         'Data Mahasiswa',
            //         style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),

            //       const SizedBox(height: 10),

            //       Image.asset(
            //         'assets/foto.jpg',
            //         width: 100,
            //         height: 100,
            //       ),

            //       // if (foto != null)
            //       //   Image.file(
            //       //     foto!,
            //       //     width: 100,
            //       //     height: 100,
            //       //   ),

            //       // Text('Nama: ${nama.text}'),
            //       // Text('NPM: ${npm.text}'),
            //       // Text('Jurusan: ${jurusan.text}'),
            //       // Text('Tempat Lahir: ${tempatLahir.text}'),
            //       // Text(
            //       //   'Tanggal Lahir: ${tanggalLahir.text}'
            //       // ),
            //     ],
            //   )
            
          ],
        ),
      )
    );
  }
}