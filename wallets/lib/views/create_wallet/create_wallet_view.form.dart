// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String WalletNameValueKey = 'walletName';

mixin $CreateWalletView on StatelessWidget {
  final TextEditingController walletNameController =
      TextEditingController(text: '');
  final FocusNode walletNameFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    walletNameController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            WalletNameValueKey: walletNameController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    walletNameController.dispose();
    walletNameFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get walletNameValue => this.formValueMap[WalletNameValueKey];

  bool get hasWalletName => this.formValueMap.containsKey(WalletNameValueKey);
}

extension Methods on FormViewModel {}
