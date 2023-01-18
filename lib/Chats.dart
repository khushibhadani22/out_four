import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'Global.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(
          physics: const BouncingScrollPhysics(),
          children: Global.contactList
              .map((e) => Card(
                    elevation: 0,
                    child: ListTile(
                      onTap: () {
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(75))),
                            context: context,
                            builder: (context) {
                              return BottomSheet(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(75))),
                                  onClosing: () {},
                                  builder: (context) {
                                    return Container(
                                      padding: const EdgeInsets.all(25),
                                      height: 400,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CircleAvatar(
                                            radius: 70,
                                            backgroundColor: Colors.blueGrey,
                                            backgroundImage:
                                                AssetImage(e['image']),
                                          ),
                                          Text(
                                            "${e['name']}",
                                            style: const TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${e['contact']}",
                                            style: const TextStyle(
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 50,
                                            width: double.infinity,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blueGrey),
                                                onPressed: () {
                                                  Share.share(
                                                      '${e['name']}\n${e['contact']}');
                                                },
                                                child: const Text(
                                                  "Share Contact",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                )),
                                          ),
                                          SizedBox(
                                            height: 50,
                                            width: double.infinity,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blueGrey),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                )),
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            });
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        backgroundImage: AssetImage(e['image']),
                      ),
                      title: Text("${e['name']}"),
                      subtitle: Text("${e['subtitle']}"),
                      trailing: Text("${e['time']}"),
                    ),
                  ))
              .toList()),
    );
  }
}
