import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool _isDeviceConnected = false;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  ConnectivityService(this.scaffoldMessengerKey);

  void initialize() {
    // Listen for connectivity changes
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> results) async {
        _isDeviceConnected =
            await InternetConnectionChecker.instance.hasConnection;
        if (!_isDeviceConnected) {
          _showNoInternetSnackBar();
        }
      },
    );
  }

  void _showNoInternetSnackBar() {
    scaffoldMessengerKey.currentState?.showSnackBar(
      const SnackBar(
        content: Text('No Internet Connection'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void dispose() {
    _connectivitySubscription.cancel();
  }
}
