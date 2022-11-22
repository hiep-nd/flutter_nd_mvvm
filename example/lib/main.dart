//
//  main.dart
//  nd_mvvm/sample
//
//  Created by Nguyen Duc Hiep on 22/11/2022.
//

import 'package:example/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'NDMVVM Example',
      home: HomePage(),
    );
  }
}
