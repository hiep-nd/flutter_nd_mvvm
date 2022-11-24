//
//  nd_stateful_widget.dart
//  nd_mvvm
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'package:flutter/widgets.dart';
import 'package:nd_mvvm/src/nd_view_model.dart';

abstract class NDStatefulWidget<T extends NDViewModel> extends StatefulWidget {
  final T viewModel;
  const NDStatefulWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);
}
