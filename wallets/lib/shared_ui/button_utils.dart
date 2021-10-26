import 'package:flutter/foundation.dart';

VoidCallback? onButtonPressed(VoidCallback callback, {bool disableIf = false}) {
  return disableIf ? null : callback;
}
