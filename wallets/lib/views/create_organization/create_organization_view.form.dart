// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String OrganizationNameValueKey = 'organizationName';
const String EntepriseNumberValueKey = 'entepriseNumber';

mixin $CreateOrganizationView on StatelessWidget {
  final TextEditingController organizationNameController =
      TextEditingController(text: '');
  final TextEditingController entepriseNumberController =
      TextEditingController(text: '');
  final FocusNode organizationNameFocusNode = FocusNode();
  final FocusNode entepriseNumberFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    organizationNameController.addListener(() => _updateFormData(model));
    entepriseNumberController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            OrganizationNameValueKey: organizationNameController.text,
            EntepriseNumberValueKey: entepriseNumberController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    organizationNameController.dispose();
    organizationNameFocusNode.dispose();
    entepriseNumberController.dispose();
    entepriseNumberFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get organizationNameValue =>
      this.formValueMap[OrganizationNameValueKey];
  String? get entepriseNumberValue =>
      this.formValueMap[EntepriseNumberValueKey];

  bool get hasOrganizationName =>
      this.formValueMap.containsKey(OrganizationNameValueKey);
  bool get hasEntepriseNumber =>
      this.formValueMap.containsKey(EntepriseNumberValueKey);
}

extension Methods on FormViewModel {}
