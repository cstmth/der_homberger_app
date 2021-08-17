import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class ConnectivityState extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  bool isOnline = false;

  ConnectivityState() {
    try {
      _connectivity.onConnectivityChanged.listen(_checkIsOnline);
    } catch (_) {}
    _checkIsOnline(null);
  }

  // Internal methods
  _checkIsOnline(_) async {
    await Future.delayed(Duration(seconds: 1));
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else {
        isOnline = false;
      }
    } on SocketException catch (error) {
      print("Connection error: $error");
      isOnline = false;
    }

    print("Connectivity: $isOnline");
    notifyListeners();
  }
}