//
//  nd_view_model_owner_state.dart
//  nd_mvvm
//
//  Created by Nguyen Duc Hiep on 22/11/2022.
//

import 'package:flutter/widgets.dart';
import 'package:nd_mvvm/src/nd_basic_view.dart';
import 'package:nd_mvvm/src/nd_view_model.dart';

abstract class NDViewModelOwnerState<W extends StatefulWidget,
    VM extends NDViewModel> extends State<W> with NDBasicView<VM> {
  // State
  @override
  void initState() {
    super.initState();
    viewModel = _ownViewModel;
  }

  @override
  void dispose() {
    viewModel = null;
    disposeViewModel(_ownViewModel);
    super.dispose();
  }

  // NDViewModelOwnerState
  VM createViewModel();
  void disposeViewModel(VM viewModel) {}

  // Privates
  late final _ownViewModel = createViewModel();
}
