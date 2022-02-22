//
//  nd_state.dart
//  nd_mvvm
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'package:flutter/widgets.dart';
import 'package:nd_mvvm/nd_stateful_widget.dart';
import 'package:nd_mvvm/nd_view.dart';
import 'package:nd_mvvm/nd_view_model.dart';

abstract class NDState<W extends NDStatefulWidget<VM>, VM extends NDViewModel>
    extends State<W> implements NDView {
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

  @override
  NDViewModel? viewModel;

  @override
  void didSetViewModelFromOldViewModel(NDViewModel? oldViewModel) {}

  @override
  bool validateViewModel(NDViewModel viewModel) => true;

  @protected
  VM? get rViewModel => viewModel as VM?;
}
