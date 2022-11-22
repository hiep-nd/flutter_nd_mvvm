//
//  nd_view_model.dart
//  nd_mvvm
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'package:flutter/foundation.dart';
import 'package:nd_mvvm/nd_mvvm.dart';
import 'package:nd_mvvm/src/logger.dart';
import 'package:nd_mvvm/src/nd_view.dart';

abstract class NDViewModel {
  /// The view. Don't use the setter unless you have got strong reason, use the
  /// ndConnect instead.
  NDView? view;

  bool validateView(NDView view);
  void didSetViewFromOldView(NDView? oldView);
}

mixin NDBasicViewModel<V extends NDView> implements NDViewModel {
  @override
  NDView? view;

  @override
  void didSetViewFromOldView(NDView? oldView) {}

  @override
  bool validateView(NDView view) => true;

  @protected
  V? get rView => view as V?;
}

void ndConnect({required NDView? view, required NDViewModel? viewModel}) {
  final testViews = viewModel?.view == view;
  final testViewModels = view?.viewModel == viewModel;
  if (testViews && testViewModels) {
    return;
  }

  if (view != null && viewModel != null && (testViews != testViewModels)) {
    logger.severe("Detect invalid route between '$viewModel' and '$view'.");
  }

  if (view == null || viewModel == null) {
    _ndBlindConnect(viewModel, view, viewModel, view);
    return;
  }

  if (!viewModel.validateView(view)) {
    logger.severe(
        "Unexpected type: Set '${view.runtimeType}' as '${viewModel.runtimeType}'.view.");
    _ndBlindConnect(viewModel, view, null, null);
    return;
  }

  if (!view.validateViewModel(viewModel)) {
    logger.severe(
        "Unexpected type: Set '${viewModel.runtimeType}' as '${view.runtimeType}'.viewModel.");
    _ndBlindConnect(viewModel, view, null, null);
    return;
  }

  _ndBlindConnect(viewModel, view, viewModel, view);
}

// ignore: non_constant_identifier_names
void _view_ViewModel_Setter(NDView? view, NDViewModel? viewModel) {
  if (view == null) {
    return;
  }

  final oldViewModel = view.viewModel;
  view.viewModel = viewModel;
  view.didSetViewModelFromOldViewModel(oldViewModel);
}

// ignore: non_constant_identifier_names
void _viewModel_View_Setter(NDViewModel? viewModel, NDView? view) {
  if (viewModel == null) {
    return;
  }

  final oldView = viewModel.view;
  viewModel.view = view;
  viewModel.didSetViewFromOldView(oldView);
}

// ignore: non_constant_identifier_names
void _ndBlindConnect(NDViewModel? viewModel, NDView? view,
    NDViewModel? viewModel1, NDView? view1) {
  _view_ViewModel_Setter(viewModel?.view, null);
  _viewModel_View_Setter(view?.viewModel, null);
  _viewModel_View_Setter(viewModel, view1);
  _view_ViewModel_Setter(view, viewModel);
}
