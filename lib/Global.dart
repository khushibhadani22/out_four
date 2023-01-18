import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'CallsCu.dart';
import 'ChatsCu.dart';
import 'SettingsCu.dart';

class Global {
  static File? pic;

  static List<Map<String, dynamic>> contactList = [
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 6.49.31 PM.jpeg',
      'name': 'Khushi Bhadani',
      'subtitle': 'Me',
      'contact': '9662914392',
      'time': '12:28 pm',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.00.12 PM.jpeg',
      'name': 'Kirit Bhadani',
      'subtitle': 'Pappa',
      'time': '1:25 am',
      'contact': '8238597057',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 6.59.47 PM.jpeg',
      'name': 'Smita Bhadani',
      'subtitle': 'Mummy',
      'time': '12:10 am',
      'contact': '9962914392',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.00.52 PM.jpeg',
      'name': 'Harshil Bhadani',
      'subtitle': 'Bhai',
      'time': '4:28 pm',
      'contact': '9327871796',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.04.49 PM.jpeg',
      'name': 'Kinjal Bhadani',
      'subtitle': 'Bhabhi',
      'time': '12:57 am',
      'contact': '9512690526',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.34.05 PM.jpeg',
      'name': 'Vaibhav Bhadani ',
      'subtitle': 'Bhai',
      'time': '08:28 pm',
      'contact': '7405541367',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.35.05 PM.jpeg',
      'name': 'Dhaval Savani',
      'subtitle': 'Bhai',
      'time': '9:08 am',
      'contact': '8758582282',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.04.49 PM (1).jpeg',
      'name': 'Kajal Kakadiya',
      'subtitle': 'Didi',
      'time': 'today',
      'contact': '7621004002',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.09.37 PM.jpeg',
      'name': 'Kavay Kakadiya',
      'subtitle': 'Bhai',
      'time': '03:00 pm',
      'contact': '9820544101',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.05.49 PM.jpeg',
      'name': 'Hasti Savani',
      'subtitle': 'Choti',
      'time': 'today',
      'contact': '8780809043',
    },
  ];
  static List<Map<String, dynamic>> contact = [
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 6.49.31 PM.jpeg',
      'name': 'Khushi Bhadani',
      'contact': '9662914392',
      'time': 'Yesterday,9:41 pm',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.00.12 PM.jpeg',
      'name': 'Kirit Bhadani',
      'contact': '8238597057',
      'time': 'Yesterday,10:25 pm',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 6.59.47 PM.jpeg',
      'name': 'Smita Bhadani',
      'contact': '9962914392',
      'time': 'April 11,6:10 pm',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.00.52 PM.jpeg',
      'name': 'Harshil Bhadani',
      'contact': '9327871796',
      'time': 'April 9,8:28 am',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.04.49 PM.jpeg',
      'name': 'Kinjal Bhadani',
      'contact': '9512690526',
      'time': 'April 1,12:57 pm',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.34.05 PM.jpeg',
      'name': 'Vaibhav Bhadani ',
      'contact': '7405541367',
      'time': 'March 22,5:28 pm',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.35.05 PM.jpeg',
      'name': 'Dhaval Savani',
      'contact': '8758582282',
      'time': 'March 23,10:08 am',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.04.49 PM (1).jpeg',
      'name': 'Kajal Kakadiya',
      'contact': '7621004002',
      'time': 'today,2:08 pm',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.09.37 PM.jpeg',
      'name': 'Kavay Kakadiya',
      'contact': '9820544101',
      'time': 'February 25,03:00 pm',
    },
    {
      'image': 'asset/image/WhatsApp Image 2023-01-01 at 7.05.49 PM.jpeg',
      'name': 'Hasti Savani',
      'contact': '8780809043',
      'time': 'today,4:00 pm',
    },
  ];
  static int indexVal = 0;
  static String selDate = '';
  static String selMonth = '';
  static String selTime = '';
  static int selHour = 0;
  static DateTime currentDate = DateTime.now();
  static TimeOfDay currentTime = TimeOfDay.now();
  static bool isIos = false;
  static File? Image;

  final ImagePicker picker = ImagePicker();
  XFile? image;
  File? photo;

  static String name = '';
  static String contactN = '';
  static DateTime IOSDate = DateTime.now();
  static DateTime IOSTime = DateTime.now();

  static List<Widget> PageCupertino = [
    const ChatsCu(),
    const CallsCu(),
    const SettingCu(),
  ];
}
