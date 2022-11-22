//
//  nd_view_model_owner_state_example.dart
//  nd_mvvm/sample
//
//  Created by Nguyen Duc Hiep on 22/11/2022.
//

import 'package:example/example_view_model.dart';
import 'package:flutter/material.dart';
import 'package:nd_core_utils/nd_core_utils.dart';
import 'package:nd_keys_observer/nd_keys_observer.dart';
import 'package:nd_mvvm/nd_mvvm.dart';

class NDViewModelOwnerStateExample extends NDStatefulWidget<ExampleViewModel> {
  const NDViewModelOwnerStateExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NDViewModelOwnerStateExampleState();
}

class _NDViewModelOwnerStateExampleState extends NDViewModelOwnerState<
    NDViewModelOwnerStateExample, ExampleViewModel> {
  @override
  ExampleViewModel createViewModel() => ExampleViewModel();

  @override
  void disposeViewModel(ExampleViewModel viewModel) => viewModel.dispose();

  @override
  void didSetViewModelFromOldViewModel(NDViewModel? oldViewModel) {
    super.didSetViewModelFromOldViewModel(oldViewModel);
    _aController.bindWithTextGetter(
      subject: rViewModel?.subject,
      keys: const ['a'],
      textGetter: () => rViewModel?.a ?? '',
    );
    _bController.bindWithTextGetter(
      subject: rViewModel?.subject,
      keys: const ['b'],
      textGetter: () => rViewModel?.b ?? '',
    );
  }

  @override
  void dispose() {
    _bag.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _aController,
              onChanged: rViewModel?.didChangeA,
            ),
          ),
          const Text(' + '),
          Flexible(
            child: TextField(
              controller: _bController,
              onChanged: rViewModel?.didChangeB,
            ),
          ),
          const Text(' = '),
          Flexible(
            child: NDObserver(
              subject: rViewModel?.subject,
              keys: const ['s'],
              builder0: () => Text(rViewModel?.s ?? ''),
            ),
          ),
        ],
      ),
    );
  }

  // Privates
  final _bag = NDDisposableBag();
  late final _aController = NDTextEditingController()..disposedBy(_bag);
  late final _bController = NDTextEditingController()..disposedBy(_bag);
}
