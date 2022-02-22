//
//  nd_view.dart
//  nd_mvvm
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'package:nd_mvvm/nd_view_model.dart';

abstract class NDView {
  NDViewModel? get viewModel;

  /// The view model. Don't use the setter unless you have got strong reason, use the
  /// ndConnect instead.
  set viewModel(NDViewModel? value);

  bool validateViewModel(NDViewModel viewModel);
  void didSetViewModelFromOldViewModel(NDViewModel? oldViewModel);
}
