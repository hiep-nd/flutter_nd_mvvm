//
//  example_view_model.dart
//  nd_mvvm/sample
//
//  Created by Nguyen Duc Hiep on 22/11/2022.
//

import 'package:nd_core_utils/nd_core_utils.dart';
import 'package:nd_keys_observer/nd_keys_observer.dart';
import 'package:nd_mvvm/nd_mvvm.dart';

class ExampleViewModel extends NDViewModel implements NDDisposable {
  // NDDisposable
  @override
  void dispose() {
    subject.dispose();
  }

  @override
  bool get isDisposed => throw UnimplementedError();

  // ExampleViewModel
  final NDSubject subject = NDSimpleSubject.create();
  String? get a => _a;
  String? get b => _b;
  String? get s => _s;

  void didChangeA(String value) {
    subject.didChange(const ['a', 's'], () {
      _a = value;
      _s = _a?.map((value1) => _b?.map((value2) => value1 + value2));
    });
  }

  void didChangeB(String value) {
    subject.didChange(const ['b', 's'], () {
      _b = value;
      _s = _a?.map((value1) => _b?.map((value2) => value1 + value2));
    });
  }

  // Privates
  String? _a;
  String? _b;
  String? _s;
}
