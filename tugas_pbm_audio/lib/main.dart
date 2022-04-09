import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Audio Player Apps'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AudioPlayer player;
  bool isPlay = false;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffF1F2B5), Color(0xff135058)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Container(
                width: 250,
                height: 240,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 4.0),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset: Offset(0, 2),
                      )
                    ],
                    image: DecorationImage(
                        image: AssetImage('assets/gambar.jpg'),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Cerita Bandung \n Bondowoso",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 250,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Center(
                      child: Text(
                    '''
                    Di suatu ketika terdapat dua kerajaan yang bertetanggaan yaitu Kerajaan Pengging dan Kerajaan Baka. Kerajaan Pengging dipimpin oleh Bandung Bondowoso sedangkan Kerajaan Baka oleh Prabu Baka. Saat peperangan antar keduanya, kerajaan Baka kalah dengan meninggalnya Prabu Baka di tangan Bandung Bondowoso. 
                    Kekalahan tersebut membuat Bandung Bondowoso menguasai kerajaan Baka. Di sana ia melihat Roro Jonggrang dan terpesona hingga melamarnya. Tentu saja hal ini ditolak oleh Roro Jonggrang. Karena sangat memaksa, Roro Jonggrang memberikan syarat untuk membangun seribu candi dalam semalam.
                    Bandung Bondowoso dibantu oleh bangsa jin sehingga pada tengah malam tersisa satu candi. Untuk menggagalkannya, Roro Jonggrang memanggil semua wanita untuk membakar jerami dan memukul lesung sehingga ayam berkokok dan para jin lari. Melihat tipu muslihat itu Bandung Bondowoso mengutuk Roro Jonggrang menjadi arca ke-1000 dan para wanita dikutuk untuk tidak ada yang mau menikahi hingga perawan tua.
                    ''',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.justify,
                  )),
                ),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 60,
                          color: Color.fromARGB(255, 196, 0, 0),
                          onPressed: () async {
                            if (isPlay) {
                              setState(() {
                                isPlay = false;
                              });
                              await player.stop();
                            } else {
                              setState(() {
                                isPlay = true;
                              });
                              await player.setAsset('assets/rekaman.mp3');
                              player.play();
                            }
                          },
                          icon: isPlay
                              ? Icon(Icons.stop_circle)
                              : Icon(Icons.play_arrow),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await player.setSpeed(0.5);
                          },
                          child: Text("0.5x"),
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              await player.setSpeed(1.0);
                            },
                            child: Text("1x")),
                        ElevatedButton(
                            onPressed: () async {
                              await player.setSpeed(1.5);
                            },
                            child: Text("1.5x"))
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
