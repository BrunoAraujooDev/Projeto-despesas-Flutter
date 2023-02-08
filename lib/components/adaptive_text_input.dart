import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptiveTextInput extends StatelessWidget {

  final String? label;
  final TextInputType? keyboardType;
  TextEditingController? controller = TextEditingController();
  void Function(String)? onSubmit;


  AdaptiveTextInput({Key? key, this.onSubmit, this.keyboardType = TextInputType
      .text, this.label, this.controller,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ?
    Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CupertinoTextField(
        controller: controller,
        keyboardType: keyboardType,
        prefix: Text(label!),
        onSubmitted: (_) => onSubmit,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      ),
    ) :
    TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label),
      onSubmitted: (_) => onSubmit,
    );
  }
}
