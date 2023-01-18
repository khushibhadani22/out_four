import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Global.dart';

class CallsCu extends StatefulWidget {
  const CallsCu({Key? key}) : super(key: key);

  @override
  State<CallsCu> createState() => _CallsCuState();
}

class _CallsCuState extends State<CallsCu> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: Global.contact
            .map((e) => Column(
                  children: [
                    Container(
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
                                  Text("${e['name']}"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("${e['time']}")
                                ],
                              )),
                          Expanded(
                              flex: 3,
                              child: CupertinoButton(
                                  onPressed: () {
                                    final Uri url =
                                        Uri.parse('tel:${e['contact']}');
                                    launchUrl(url);
                                  },
                                  child: const Icon(
                                    CupertinoIcons.phone,
                                    color: CupertinoColors.black,
                                  )))
                        ],
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
