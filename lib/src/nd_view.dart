//
//  nd_view.dart
//  nd_mvvm
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'package:flutter/foundation.dart';
import 'package:nd_mvvm/src/nd_view_model.dart';

abstract class NDView {
  NDViewModel? get viewModel;

  /// The view model. Don't use the setter unless you have got strong reason, use the
  /// ndConnect instead.
  set viewModel(NDViewModel? value);

  bool validateViewModel(NDViewModel viewModel);
  void didSetViewModelFromOldViewModel(NDViewModel? oldViewModel);
}

mixin NDBasicView<VM extends NDViewModel> implements NDView {
  @override
  NDViewModel? viewModel;

  @override
  void didSetViewModelFromOldViewModel(NDViewModel? oldViewModel) {}

  @override
  bool validateViewModel(NDViewModel viewModel) => true;

  @protected
  VM? get rViewModel => viewModel as VM?;
}
