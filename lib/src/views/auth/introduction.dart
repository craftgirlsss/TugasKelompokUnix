// Halaman Awal
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tugas_putra/src/components/global_variable.dart';
import 'package:tugas_putra/src/components/helpers.dart';
import 'package:tugas_putra/src/views/auth/login.dart';
import 'package:tugas_putra/src/views/auth/signup.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});


  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/calendar.png"),
                // Image.network("https://masputra.nextjiesdev.site/assets/kuliah/calendar.gif",
                //   filterQuality: FilterQuality.high,
                //   errorBuilder: (context, error, stackTrace) => const Icon(Icons.calendar_month, size: 100), width: size.width / 2,
                //   loadingBuilder: (BuildContext context, Widget image, ImageChunkEvent? loadingProgress) {
                //     if (loadingProgress == null) return image;
                //     return SizedBox(
                //       child: Center(
                //         child: CircularProgressIndicator(
                //           value: loadingProgress.expectedTotalBytes != null
                //             ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                //             : null,
                //         ),
                //       ),
                //     );
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GradientText(
                        'Eventku',
                        style: const TextStyle(fontSize: 40),
                        gradient: LinearGradient(colors: [
                          GlobalVariable.primaryColor,
                          Colors.blue.shade500,
                          Colors.red.shade300
                        ]),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Atur event kegiatan anda dengan mudah dalam satu genggaman.',
                          style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: size.width/1.2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalVariable.primaryColor,
                      elevation: 0,
                      shape: const StadiumBorder()
                    ),
                    onPressed: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => const HalamanLoaigin()));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width/ 1.2,
                  child: OutlinedButton(
                    style: const ButtonStyle(
                      side: WidgetStatePropertyAll(BorderSide(color: GlobalVariable.primaryColor)),
                      elevation: WidgetStatePropertyAll(0),
                      shape: WidgetStatePropertyAll(StadiumBorder())
                    ),
                    onPressed: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => const HalamanSignUp()));
                    },
                    child: const Text('Sign Up', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: GlobalVariable.primaryColor)),
                  )
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CupertinoButton(
          onPressed: (){
            showBottomModalDialog(
              size: size, 
              context: context, 
              children: [
                const Text("Daftar Developer Aplikasi", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(child: Text("Kalian juga bisa berkontribusi ke projek ini melalui repository github yang sudah kami buat.", style: TextStyle(color: Colors.black54))),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(EvaIcons.github, color: Colors.indigoAccent), onPressed: (){
                        urlLauncher(url: "https://github.com/unix-community-indonesia");
                      }
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  runSpacing: 15,
                  children: List.generate(dataDeveloper.length, (i) {
                    return CupertinoButton(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      onPressed: (){
                        urlLauncher(url: dataDeveloper[i]['details']['url']);
                      },
                      child: Column(
                        children: [
                          CircleAvatar(radius: 30, backgroundColor: GlobalVariable.primaryColor.withOpacity(0.5),
                          onBackgroundImageError: (exception, stackTrace) => const Icon(CupertinoIcons.person_2_alt, color: Colors.white),
                          backgroundImage: NetworkImage(dataDeveloper[i]['details']['photo']),
                          ),
                          const SizedBox(height: 10),
                          Text(dataDeveloper[i]['details']['name'], style: const TextStyle(fontSize: 13, color: Colors.black))
                        ],
                      ),
                    );
                  }),
                )
              ]
            );
          },
          child: const Text("Lihat Developer", textAlign: TextAlign.center, style: TextStyle(color: GlobalVariable.primaryColor, fontWeight: FontWeight.bold, fontSize: 13),)
        ),
      )
    );
  }
}