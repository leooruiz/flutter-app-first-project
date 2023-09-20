import 'package:flutter/material.dart';

class AllLevelInherited extends InheritedWidget {
  AllLevelInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  double overAllLevel = 0;

  static AllLevelInherited of(BuildContext context) {
    final AllLevelInherited? result =
        context.dependOnInheritedWidgetOfExactType();
    assert(result != null, 'No AllLevelInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AllLevelInherited oldWidget) {
    return oldWidget.overAllLevel != overAllLevel;
    //retornará true quando o valor atual da tasklist for dferente do antigo, ou seja, irá observar se há a mudança na list, caso sim, return true.
  }
}
