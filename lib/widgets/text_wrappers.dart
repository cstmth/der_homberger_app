import 'package:flutter/material.dart';

class Headline3 extends StatelessWidget {
  final String text;

  const Headline3(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}

class Headline4 extends StatelessWidget {
  final String text;

  const Headline4(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class Headline5 extends StatelessWidget {
  final String text;

  const Headline5(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}

class Headline6 extends StatelessWidget {
  final String text;

  const Headline6(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}

class Overline extends StatelessWidget {
  final String text;

  const Overline(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: Theme.of(context).textTheme.overline,
    );
  }
}

class Caption extends StatelessWidget {
  final String text;

  const Caption(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.caption,
    );
  }
}

class Monospace extends StatelessWidget {
  final String text;

  const Monospace(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontFamily: "UbuntuMono"),
    );
  }
}
