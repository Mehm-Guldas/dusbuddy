import 'package:dusbuddy2/Pages/examinfo.dart';
import 'package:dusbuddy2/Pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:dusbuddy2/Pages/about.dart';
import 'package:dusbuddy2/Pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/about': (context) => About(),
    '/settings': (context) => Settings(),
    '/examinfo': (context) => Examinfo(),

  },
));



