import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Global.dart';

class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(
          physics: const BouncingScrollPhysics(),
          children: Global.contact
              .map((e) => Card(
                    elevation: 0,
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          backgroundImage: AssetImage(e['image']),
                        ),
                        title: Text("${e['name']}"),
                        subtitle: Text("${e['time']}"),
                        trailing: IconButton(
                          onPressed: () {
                            final Uri url = Uri.parse('tel:${e['contact']}');
                            launchUrl(url);
                          },
                          icon: const Icon(
                            Icons.call,
                            color: Colors.green,
                          ),
                        )),
                  ))
              .toList()),
    );
  }
}
