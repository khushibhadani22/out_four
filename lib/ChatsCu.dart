import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'Global.dart';

class ChatsCu extends StatefulWidget {
  const ChatsCu({Key? key}) : super(key: key);

  @override
  State<ChatsCu> createState() => _ChatsCuState();
}

class _ChatsCuState extends State<ChatsCu> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: Global.contactList
            .map((e) => Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return Container(
                                width: double.infinity,
                                height: 350,
                                color: CupertinoColors.white,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: CupertinoColors
                                          .inactiveGray
                                          .withOpacity(0.5),
                                      backgroundImage:
                                          AssetImage("${e['image']}"),
                                      radius: 70,
                                    ),
                                    Text(
                                      "${e['name']}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      "+91 ${e['contact']}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 350,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: CupertinoColors.black,
                                      ),
                                      child: CupertinoButton(
                                        onPressed: () {
                                          Share.share(
                                              '${e['name']}\n${e['contact']}');
                                        },
                                        child: const Text(
                                          "Share Contact",
                                          style: TextStyle(
                                              color: CupertinoColors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 350,
                                      decoration: BoxDecoration(
                                          color: CupertinoColors.black,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: CupertinoButton(
                                          child: const Text(
                                            "Cancel",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: CupertinoColors.white),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          }),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        color: CupertinoColors.white,
                        height: 60,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: CircleAvatar(
                                  //  radius: 20,
                                  backgroundColor: CupertinoColors.inactiveGray,
                                  backgroundImage: AssetImage(e['image']),
                                )),
                            Expanded(
                                flex: 8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${e['name']}",
                                    ),
                                    Text(
                                      "${e['subtitle']}",
                                    )
                                  ],
                                )),
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "${e['time']}",
                                ))
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: CupertinoColors.inactiveGray,
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
