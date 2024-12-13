
// Halaman Login
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tugas_putra/src/components/global_variable.dart';
import 'package:tugas_putra/src/views/auth/introduction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    DateTime newYorkTime =  now.subtract(const Duration(hours: 11));
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Dashboard"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: size.width,
                padding: const EdgeInsets.all(20),
                // height: size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black12
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(DateFormat('EEEE').format(now), style: const TextStyle(fontSize: 20)),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(DateFormat('hh.mm').format(now), style: const TextStyle(fontSize: 60), overflow: TextOverflow.clip, maxLines: 1),
                              Text(DateFormat('MMM').format(now).toUpperCase(), style: const TextStyle(fontSize: 70), overflow: TextOverflow.clip, maxLines: 1),
                            ],
                          ),
                          const VerticalDivider(
                            thickness: 1,
                            width: 20,
                            indent: 20,
                            endIndent: 20,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    dense: true,
                                    title: Text(DateFormat().add_jm().format(now), style: const TextStyle(fontSize: 30)),
                                    subtitle: const Text("Sidoarjo", style: TextStyle(fontSize: 15, color: Colors.black54)),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    dense: true,
                                    title: Text(DateFormat().add_jm().format(newYorkTime), style: const TextStyle(fontSize: 30)),
                                    subtitle: const Text("New York", style: TextStyle(fontSize: 15, color: Colors.black54)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: const BoxDecoration(
                          color: Colors.white
                        ),
                        child: TableCalendar(
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: DateTime.now(),
                        )
                      ),
                  ],
                ),
              ),
              Padding(
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
                      Navigator.pushAndRemoveUntil(context, CupertinoDialogRoute(builder: (context) => const Introduction(), context: context), (route) => false);
                    },
                    child: const Text(
                      'Keluar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}