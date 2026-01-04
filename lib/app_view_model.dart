import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> appLevelKey =
    GlobalKey<NavigatorState>(debugLabel: 'app-key');

void closeAppLoader() {
  if (appLevelKey.currentState?.canPop() ?? false) {
    appLevelKey.currentState?.pop();
  }
}
