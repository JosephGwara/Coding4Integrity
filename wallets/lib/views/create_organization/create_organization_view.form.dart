// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String OrganizatioNameValueKey = 'organizatioName';

mixin $CreateOrganizationView on StatelessWidget {
  final TextEditingController organizatioNameController =
      TextEditingController(text: '');
  final FocusNode organizatioNameFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    organizatioNameController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            OrganizatioNameValueKey: organizatioNameController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    organizatioNameController.dispose();
    organizatioNameFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get organizatioNameValue =>
      this.formValueMap[OrganizatioNameValueKey];

  bool get hasOrganizatioName =>
      this.formValueMap.containsKey(OrganizatioNameValueKey);
}

extension Methods on FormViewModel {}
