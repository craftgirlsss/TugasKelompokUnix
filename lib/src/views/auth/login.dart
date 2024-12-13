import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_putra/src/components/global_variable.dart';
import 'package:tugas_putra/src/components/helpers.dart';
import 'package:tugas_putra/src/views/todo/home.dart';

class HalamanLoaigin extends StatefulWidget {
  const HalamanLoaigin({super.key});

  @override
  State<HalamanLoaigin> createState() => _HalamanLoaiginState();
}

class _HalamanLoaiginState extends State<HalamanLoaigin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/login.png', width: size.width / 1.3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GradientText(
                    "Atur jadwal dengan mudah dalam satu genggaman",
                    style: const TextStyle(fontSize: 20),
                    gradient: LinearGradient(colors: [
                      GlobalVariable.primaryColor,
                      Colors.blue.shade500,
                      Colors.red.shade300
                    ]),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text("Masukkan alamat email yang sudah anda daftarkan pada platform", style: TextStyle(color: Colors.black54)),
                ),
                const SizedBox(height: 20),
                EmailTextField(
                  controller: email,
                ),
                PasswordTextField(
                  controller: password,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      padding: const EdgeInsets.only(right: 30),
                      child: const Text("Lupa Password?", style: TextStyle(color: GlobalVariable.primaryColor, fontWeight: FontWeight.bold, fontSize: 14)), onPressed: (){}),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SizedBox(
            width: size.width/1.2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: GlobalVariable.primaryColor,
                elevation: 0,
                shape: const StadiumBorder()
              ),
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}