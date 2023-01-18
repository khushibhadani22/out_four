import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Global.dart';

class StepVal extends StatefulWidget {
  const StepVal({Key? key}) : super(key: key);

  @override
  State<StepVal> createState() => _StepValState();
}

class _StepValState extends State<StepVal> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? photo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 400,
        width: 420,
        child: Stepper(
            physics: const BouncingScrollPhysics(),
            currentStep: Global.indexVal,
            controlsBuilder: (context, _) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (Global.indexVal < 2) {
                                Global.indexVal++;
                              }
                            });
                          },
                          child: (Global.indexVal == 2)
                              ? const Text(
                                  "ADD",
                                )
                              : const Text("CONTINUE")),
                      const SizedBox(
                        width: 10,
                      ),
                      (Global.indexVal != 0)
                          ? OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  if (Global.indexVal > 0) {
                                    Global.indexVal--;
                                  }
                                });
                              },
                              child: const Text("CANCEL"))
                          : Container()
                    ],
                  ),
                ),
              );
            },
            steps: <Step>[
              Step(
                title: const Text(
                  "Profile Name",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                subtitle: const Text(
                  "Add Profile",
                ),
                isActive: false,
                content: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.blueGrey.shade200,
                      backgroundImage:
                          (photo == null) ? null : (FileImage(photo!)),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.blueGrey.shade900,
                      mini: true,
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: const Text("Pick Image"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () async {
                                        image = await _picker.pickImage(
                                            source: ImageSource.camera);
                                        setState(() {
                                          photo = File(image!.path);
                                        });
                                        Global.pic = photo;
                                        Navigator.of(context).pop();
                                      },
                                      child: const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 30,
                                      )),
                                  ElevatedButton(
                                      onPressed: () async {
                                        image = await _picker.pickImage(
                                            source: ImageSource.gallery);
                                        setState(() {
                                          photo = File(image!.path);
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: const Icon(
                                        Icons.photo,
                                        size: 30,
                                      )),
                                  // Navigator.of(context).pop(),
                                ],
                              );
                            });
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const Step(
                  title: Text("Name", style: TextStyle(color: Colors.blueGrey)),
                  subtitle: Text("Enter Name"),
                  isActive: false,
                  content: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Khushi Bhadani",
                    ),
                  )),
              const Step(
                  title:
                      Text("Contact", style: TextStyle(color: Colors.blueGrey)),
                  subtitle: Text("Enter Contact"),
                  isActive: false,
                  content: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "9662914392",
                    ),
                  )),
            ]),
      ),
    );
  }
}
