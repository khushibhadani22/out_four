import 'package:flutter/cupertino.dart';

import 'Global.dart';

class SettingCu extends StatefulWidget {
  const SettingCu({Key? key}) : super(key: key);

  @override
  State<SettingCu> createState() => _SettingCuState();
}

class _SettingCuState extends State<SettingCu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Date",
                  style: TextStyle(
                      color: CupertinoColors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${Global.IOSDate.day}/${Global.IOSDate.month}/${Global.IOSDate.year}",
                  style: const TextStyle(
                      color: CupertinoColors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 60,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CupertinoColors.black,
                ),
                child: CupertinoButton(
                    child: const Text(
                      "Change Date",
                      style: TextStyle(
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 300,
                              color: CupertinoColors.quaternarySystemFill,
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: 300,
                                      child: CupertinoDatePicker(
                                        backgroundColor: CupertinoColors.black,
                                        mode: CupertinoDatePickerMode.date,
                                        initialDateTime: Global.IOSDate,
                                        onDateTimeChanged: (val) {
                                          setState(() {
                                            Global.IOSDate = val;
                                          });
                                        },
                                      ))
                                ],
                              ),
                            );
                          });
                    })),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Time",
                  style: TextStyle(
                      color: CupertinoColors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${Global.IOSTime.hour}:${Global.IOSTime.minute} ",
                  style: const TextStyle(
                      color: CupertinoColors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 60,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CupertinoColors.black,
                ),
                child: CupertinoButton(
                    child: const Text(
                      "Change Time",
                      style: TextStyle(
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 300,
                              color: CupertinoColors.quaternarySystemFill,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 300,
                                    child: CupertinoDatePicker(
                                      backgroundColor: CupertinoColors.black,
                                      initialDateTime: Global.IOSTime,
                                      mode: CupertinoDatePickerMode.time,
                                      onDateTimeChanged: (DateTime val) {
                                        setState(() {
                                          Global.IOSTime = val;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    })),
            const SizedBox(
              height: 520,
            )
          ],
        ),
      ),
    );
  }
}
