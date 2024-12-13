import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_putra/src/views/auth/introduction.dart';

class SuccessRegisterPage extends StatefulWidget {
  const SuccessRegisterPage({super.key});

  @override
  State<SuccessRegisterPage> createState() => _SuccessRegisterPageState();
}

class _SuccessRegisterPageState extends State<SuccessRegisterPage> {
  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(236, 185, 48, 1),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(child: Image.asset("assets/success.gif")),
              const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Berhasil", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center),
                      SizedBox(width: 10),
                      Icon(Icons.cloud_done, color: Colors.white)
                    ],
                  ),
                  Text("Anda berhasil membaut akun, silahkan konfirmasi pembuatan akun anda", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal, fontSize: 15), textAlign: TextAlign.center),  
                ],
              ),
              
              SizedBox(
                width: size.width/1.2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: const StadiumBorder()
                  ),
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const Introduction()), (route) => false);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(236, 185, 48, 1)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}