import 'package:der_homberger_app/providers/authentication_state.dart';
import 'package:der_homberger_app/providers/connection_state.dart';
import 'package:der_homberger_app/providers/position_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HombergerMultiProvider extends StatelessWidget {
  final Widget child;

  const HombergerMultiProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthState>(
      create: (context) => AuthState(),
      child: ChangeNotifierProvider<NavPositionState>(
        create: (context) => NavPositionState(),
        child: ChangeNotifierProvider<ConnectivityState>(
          create: (context) => ConnectivityState(),
          child: child,
        ),
      ),
    );
  }
}
