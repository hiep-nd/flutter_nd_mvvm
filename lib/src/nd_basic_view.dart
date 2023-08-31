//
//  nd_basic_view.dart
//  nd_mvvm
//
//  Created by Nguyen Duc Hiep on 01/04/2023.
//

import 'package:flutter/foundation.dart';
import 'package:nd_mvvm/src/logger.dart';
import 'package:nd_mvvm/src/nd_view.dart';
import 'package:nd_mvvm/src/nd_view_model.dart';

mixin NDBasicView<VM extends NDViewModel> implements NDView<VM> {
  @override
  VM? get viewModel => _vm;

  set viewModel(VM? viewModel) {
    if (_vm == viewModel) {
      return;
    }

    if (viewModel == null) {
      _blindSetViewModel(viewModel);
      return;
    }

    if (!validateViewModel(viewModel)) {
      logger.severe(
          "Unexpected type: Set '${viewModel.runtimeType}' as '$runtimeType'.viewModel.");
      _blindSetViewModel(viewModel);
      return;
    }

    _blindSetViewModel(viewModel);
  }

  @override
  void didSetViewModelFromOldViewModel(NDViewModel? oldViewModel) {}

  @override
  bool validateViewModel(NDViewModel viewModel) => true;

  @protected
  VM? _vm;

  // Privates
  // ignore: non_constant_identifier_names
  void _blindSetViewModel(VM? viewModel) {
    final oldViewModel = _vm;
    _vm = viewModel;
    didSetViewModelFromOldViewModel(oldViewModel);
  }
}
