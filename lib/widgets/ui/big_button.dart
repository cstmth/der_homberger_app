import 'package:der_homberger_app/utility/constants.dart';
import 'package:flutter/material.dart';

class HombergerTextButton extends StatelessWidget {
  final bool isAccent;
  final VoidCallback onPressed;
  final Text child;

  const HombergerTextButton({this.isAccent = false, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: isAccent ? _ButtonStyles.accentuatedBigButton : _ButtonStyles.bigButton,
    );
  }
}

class HombergerIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;

  const HombergerIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _ButtonStyles.iconButton,
      child: icon,
    );
  }
}

class _ButtonStyles {
  static final ButtonStyle bigButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.white),
    foregroundColor: MaterialStateProperty.all(AppColors.darkGray),
    fixedSize: MaterialStateProperty.all(Size.fromHeight(48.0)),
    elevation: MaterialStateProperty.all(0.0),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: Styles.bigBorderRadius,
      side: BorderSide(
        color: AppColors.darkGray,
        width: 1,
      ),
    )),
  );

  static final ButtonStyle accentuatedBigButton = bigButton.copyWith(
    backgroundColor: MaterialStateProperty.all(AppColors.primary),
    foregroundColor: MaterialStateProperty.all(Colors.white),
  );

  static final iconButton = bigButton.copyWith(fixedSize: MaterialStateProperty.all(Size.square(48.0)));
}
