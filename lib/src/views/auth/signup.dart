import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tugas_putra/src/components/global_variable.dart';
import 'package:tugas_putra/src/components/helpers.dart';
import 'package:tugas_putra/src/views/auth/success.dart';

class HalamanSignUp extends StatefulWidget {
  const HalamanSignUp({super.key});

  @override
  State<HalamanSignUp> createState() => _HalamanSignUpState();
}

class _HalamanSignUpState extends State<HalamanSignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();

  List kategori = ["Pelajar", "Pekerja", "Wirausahawan"];
  List<bool> checkedValues = [false, false, false];
  DateTime? _selectedDay;
  DateTime focusedDay = DateTime.now();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    nama.dispose();
    tanggalLahir.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Sign Up"),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/signup.png', width: size.width / 1.3),
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
                AnyTextField(
                  controller: nama,
                ),
                EmailTextField(
                  controller: email,
                ),
                PasswordTextField(
                  controller: password,
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Tanggal lahir", style: TextStyle(color: GlobalVariable.primaryColor, fontWeight: FontWeight.bold, fontSize: 17)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  child: TableCalendar(
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        focusedDay = focusedDay; // update `focusedDay` here as well
                      });
                    },
                    calendarStyle: const CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: GlobalVariable.primaryColor,
                        shape: BoxShape.circle
                      )
                    ),
                    onPageChanged: (focusedDay) {
                      focusedDay = focusedDay;
                    },
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                  )
                ),
                const SizedBox(height: 5),
                Text("Tanggal lahir anda : ${_selectedDay != null ? DateFormat('dd MMMM yyyy').format(_selectedDay!) : 0}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54)),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Status Anda", style: TextStyle(color: GlobalVariable.primaryColor, fontWeight: FontWeight.bold, fontSize: 17)),
                    ],
                  ),
                ),
                Wrap(
                  children: List.generate(kategori.length, (i){
                    return Row(
                      children: [
                        CupertinoCheckbox(
                          activeColor: GlobalVariable.primaryColor,
                          value: checkedValues[i], onChanged: (val) {
                          setState(() {
                            checkedValues[i] = val!;
                          });
                        }),
                        Text(kategori[i])
                      ],
                    );
                  })
                ),
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
                Navigator.pushAndRemoveUntil(context, CupertinoDialogRoute(builder: (context) => const SuccessRegisterPage(), context: context), (route) => false);
              },
              child: const Text(
                'Daftar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}