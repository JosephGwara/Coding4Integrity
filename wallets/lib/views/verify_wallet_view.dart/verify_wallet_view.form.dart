// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String PrivateKeyValueKey = 'privateKey';

mixin $VerifyWalletView on StatelessWidget {
  final TextEditingController privateKeyController =
      TextEditingController(text: '');
  final FocusNode privateKeyFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    privateKeyController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            PrivateKeyValueKey: privateKeyController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    privateKeyController.dispose();
    privateKeyFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get privateKeyValue => this.formValueMap[PrivateKeyValueKey];

  bool get hasPrivateKey => this.formValueMap.containsKey(PrivateKeyValueKey);
}

extension Methods on FormViewModel {}
