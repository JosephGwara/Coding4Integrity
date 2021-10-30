import 'package:flutter/material.dart';

class RenderOnBoolean extends StatelessWidget {
  final bool boolean;
  final Widget whenTrueRender;
  final Widget whenFalseRender;

  RenderOnBoolean({
    required this.boolean,
    required this.whenTrueRender,
    required this.whenFalseRender,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return boolean ? whenTrueRender : whenFalseRender;
  }
}
