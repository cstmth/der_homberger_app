import 'package:der_homberger_app/providers/connection_state.dart';
import 'package:der_homberger_app/utility/constants.dart';
import 'package:der_homberger_app/widgets/screen_types/complex_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoConnectionBanner extends StatelessWidget {
  final ConnectionType _connectionType;
  final String? info;

  const NoConnectionBanner(this._connectionType, {this.info});

  @override
  Widget build(BuildContext context) {
    bool isOnline = context.read<ConnectivityState>().isOnline;
    if (isOnline || _connectionType == ConnectionType.NONE) return SizedBox.shrink();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryWithAlpha,
        border: Border(bottom: BorderSide(color: AppColors.darkGray, width: 0.5)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Row(
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: 32,
            ),
            Container(width: 16),
            Expanded(
              child: Text(getInfo()),
            ),
          ],
        ),
      ),
    );
  }

  String getInfo() {
    if (info != null) return info!;

    switch (_connectionType) {
      case ConnectionType.NONE:
        return "Wenn du das hier siehst ist etwas schief gegangen.";

      case ConnectionType.GET:
        return "Stelle eine Internetverbindung her, um die angezeigten Informationen zu aktualisieren. Ihre Gültigkeit kann offline nicht garantiert werden.";

      case ConnectionType.POST:
        return "Stelle eine Internetverbindung her, um Inhalte und Änderungen zu teilen.";

      case ConnectionType.BOTH:
        return "Stelle eine Internetverbindung her, um die angezeigten Informationen zu aktualisieren und Inhalte und Änderungen zu teilen. Die Gültigkeit der angezeigten Informationen kann offline nicht garantiert werden.";
    }
  }
}
