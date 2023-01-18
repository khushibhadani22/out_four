import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Calls.dart';
import 'CallsCu.dart';
import 'Chats.dart';
import 'ChatsCu.dart';
import 'Settings.dart';
import 'SettingsCu.dart';
import 'StepPage.dart';

import 'Global.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final CupertinoTabController controller = CupertinoTabController();
    TabController tabController = TabController(length: 3, vsync: this);
    PageController pageController = PageController();
    int num = 0;
    List<Widget> page = [
      const Chats(),
      const Calls(),
      const Setting(),
    ];

    return (Global.isIos == true)
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => CupertinoPageScaffold(
                    backgroundColor: CupertinoColors.white,
                    navigationBar: CupertinoNavigationBar(
                      backgroundColor: CupertinoColors.white,
                      trailing: (CupertinoSwitch(
                        onChanged: (val) {
                          setState(() {
                            Global.isIos = val;
                          });
                        },
                        value: Global.isIos,
                      )),
                      middle: const Text(
                        "Platform Convertor",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.black),
                      ),
                      leading: const Icon(
                        CupertinoIcons.line_horizontal_3,
                        color: CupertinoColors.black,
                      ),
                    ),
                    child: CupertinoTabScaffold(
                      controller: controller,
                      tabBar: CupertinoTabBar(
                          backgroundColor: CupertinoColors.white,
                          onTap: (val) {
                            setState(() {});
                          },
                          items: const <BottomNavigationBarItem>[
                            BottomNavigationBarItem(
                                icon: Icon(
                              CupertinoIcons.chat_bubble_2,
                              color: CupertinoColors.black,
                            )),
                            BottomNavigationBarItem(
                                icon: Icon(
                              CupertinoIcons.phone,
                              color: CupertinoColors.black,
                            )),
                            BottomNavigationBarItem(
                                icon: Icon(
                              CupertinoIcons.settings,
                              color: CupertinoColors.black,
                            )),
                          ]),
                      tabBuilder: (Context, i) {
                        return CupertinoTabView(
                          builder: (context) {
                            return CupertinoPageScaffold(
                                backgroundColor: CupertinoColors.white,
                                child: (i == 0)
                                    ? const ChatsCu()
                                    : (i == 1)
                                        ? const CallsCu()
                                        : const SettingCu());
                          },
                        );
                      },
                    ),
                  )
            },
          )
        : MaterialApp(
            theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: Colors.blueGrey, secondary: Colors.blueGrey)),
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => Scaffold(
                    drawer: Drawer(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.blueGrey,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(
                                          "assate/image/WhatsApp Image 2023-01-01 at 6.49.35 PM.jpeg"),
                                    ),
                                  ),
                                  Text(
                                    "  Khushi Bhadani",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "  9662914392",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 7,
                              child: ListView(
                                children: const [
                                  ListTile(
                                    leading: Icon(
                                      Icons.people_alt_outlined,
                                      color: Colors.blueGrey,
                                    ),
                                    title: Text("Create Group"),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.person_outline,
                                      color: Colors.blueGrey,
                                    ),
                                    title: Text("New Contact"),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.call_outlined,
                                      color: Colors.blueGrey,
                                    ),
                                    title: Text("Calls"),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.bookmark_border_outlined,
                                      color: Colors.blueGrey,
                                    ),
                                    title: Text("Saved Messages"),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.settings_outlined,
                                      color: Colors.blueGrey,
                                    ),
                                    title: Text("Settings"),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    appBar: AppBar(
                      title: const Text(
                        "Platform Convertor",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      actions: [
                        Switch(
                            value: Global.isIos,
                            onChanged: (val) {
                              setState(() {
                                Global.isIos = val;
                              });
                            })
                      ],
                      bottom: TabBar(
                        onTap: (val) {
                          setState(() {
                            num = val;
                            pageController.animateToPage(val,
                                duration: const Duration(microseconds: 250),
                                curve: Curves.easeIn);
                          });
                        },
                        controller: tabController,
                        indicatorColor: Colors.white,
                        tabs: const <Tab>[
                          Tab(
                            child: Text(
                              "CHATS",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "CALLS",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "SETTINGS",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.blueGrey.shade500,
                    ),
                    body: PageView(
                      onPageChanged: (val) {
                        setState(() {
                          tabController.animateTo(val);
                          num = val;
                        });
                      },
                      controller: pageController,
                      children: page.map((e) => e).toList(),
                    ),
                    floatingActionButton: (tabController.index == 0)
                        ? FloatingActionButton(
                            backgroundColor: Colors.blueGrey.shade500,
                            onPressed: () async {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const StepVal();
                                  });
                            },
                            child: const Icon(Icons.add),
                          )
                        : null,
                  ),
            },
          );
  }
}
