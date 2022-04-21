// ignore_for_file: use_key_in_widget_constructors, unused_label

import 'package:flutter/material.dart';
import 'package:geeksalonquizapp/start_page.dart';
// import 'package:flutter/rendering.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Root());
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Start();
  }
}
