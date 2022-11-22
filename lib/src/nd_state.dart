//
//  nd_state.dart
//  nd_mvvm
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'package:flutter/widgets.dart';
import 'package:nd_mvvm/src/nd_stateful_widget.dart';
import 'package:nd_mvvm/src/nd_view.dart';
import 'package:nd_mvvm/src/nd_view_model.dart';

abstract class NDState<W extends NDStatefulWidget<VM>, VM extends NDViewModel>
    extends State<W> with NDBasicView<VM> {
  @override
  void initState() {
    super.initState();
    ndConnect(view: this, viewModel: widget.viewModel);
  }

  @override
  void didUpdateWidget(covariant W oldWidget) {
    super.didUpdateWidget(oldWidget);
    ndConnect(view: this, viewModel: widget.viewModel);
  }

  @override
  void dispose() {
    ndConnect(view: null, viewModel: viewModel);
    super.dispose();
  }
}
