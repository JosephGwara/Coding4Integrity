// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String AddressFilterValueKey = 'addressFilter';

mixin $SelectRecepientView on StatelessWidget {
  final TextEditingController addressFilterController =
      TextEditingController(text: '');
  final FocusNode addressFilterFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    addressFilterController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            AddressFilterValueKey: addressFilterController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    addressFilterController.dispose();
    addressFilterFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get addressFilterValue => this.formValueMap[AddressFilterValueKey];

  bool get hasAddressFilter =>
      this.formValueMap.containsKey(AddressFilterValueKey);
}

extension Methods on FormViewModel {}
