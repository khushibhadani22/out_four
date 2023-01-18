import 'package:flutter/material.dart';

import 'Global.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Date",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                Global.selDate,
                style: const TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                padding:
                    const EdgeInsets.symmetric(horizontal: 130, vertical: 20)),
            onPressed: () async {
              DateTime? data = await showDatePicker(
                  selectableDayPredicate: (DateTime val) {
                    if (val.isAfter(
                            DateTime.now().subtract(const Duration(days: 1))) &&
                        val.isBefore(
                            DateTime.now().add(const Duration(days: 15)))) {
                      return true;
                    }
                    return false;
                  },
                  context: context,
                  initialDate: Global.currentDate,
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2030));
              if (data!.month == 1) {
                Global.selMonth = 'Jan';
              } else if (data.month == 2) {
                Global.selMonth = 'Feb';
              } else if (data.month == 3) {
                Global.selMonth = 'March';
              } else if (data.month == 4) {
                Global.selMonth = 'April';
              } else if (data.month == 5) {
                Global.selMonth = 'May';
              } else if (data.month == 6) {
                Global.selMonth = 'Jun';
              } else if (data.month == 7) {
                Global.selMonth = 'July';
              } else if (data.month == 8) {
                Global.selMonth = 'Aug';
              } else if (data.month == 9) {
                Global.selMonth = 'Sep';
              } else if (data.month == 10) {
                Global.selMonth = 'Oct';
              } else if (data.month == 11) {
                Global.selMonth = 'Nov';
              } else if (data.month == 12) {
                Global.selMonth = 'Dec';
              }
              setState(() {
                Global.selDate = '${data.day},${Global.selMonth} ${data.year}';
              });
            },
            child: const Text(
              "Change Date",
              style: TextStyle(color: Colors.white, fontSize: 15),
            )),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Time",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                Global.selTime,
                style: const TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                padding:
                    const EdgeInsets.symmetric(horizontal: 130, vertical: 20)),
            onPressed: () async {
              TimeOfDay? time = await showTimePicker(
                  context: context, initialTime: Global.currentTime);
              setState(() {
                if (time!.hour > 12) {
                  Global.selHour = time.hour - 12;
                }

                Global.selTime =
                    '${Global.selHour}:${time.minute} ${time.period.name}';
              });
            },
            child: const Text(
              "Change Time",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ))
      ],
    ));
  }
}
