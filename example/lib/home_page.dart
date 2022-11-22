//
//  home_page.dart
//  nd_mvvm/sample
//
//  Created by Nguyen Duc Hiep on 22/11/2022.
//

import 'package:example/example_view_model.dart';
import 'package:example/nd_state_example.dart';
import 'package:example/nd_view_model_owner_state_example.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NDMVVM Example')),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              NDStateExample(viewModel: _exampleViewModel),
              const NDViewModelOwnerStateExample(),
            ],
          ),
        ),
      ),
    );
  }

  // Privates
  late final _exampleViewModel = ExampleViewModel();
}
