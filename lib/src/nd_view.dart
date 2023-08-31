//
//  nd_view.dart
//  nd_mvvm
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'package:nd_mvvm/src/nd_view_model.dart';

abstract class NDView<VM extends NDViewModel> {
  VM? get viewModel;

  bool validateViewModel(VM viewModel);
  void didSetViewModelFromOldViewModel(VM? oldViewModel);
}
