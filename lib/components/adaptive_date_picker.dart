import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class AdaptiveDatePicker extends StatelessWidget {

  final DateTime? selectedDate;
  final void Function(DateTime)? onChangedTime;


  const AdaptiveDatePicker({Key? key, this.selectedDate, this.onChangedTime}) : super(key: key);

  _showDatePicker(BuildContext context) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onChangedTime!(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ?
    Container(
      height: 180,
      child: CupertinoDatePicker(onDateTimeChanged: onChangedTime!,
      mode: CupertinoDatePickerMode.date,
      maximumDate: DateTime.now(),
      minimumDate: DateTime(2022),
      initialDateTime: DateTime.now(),),
    ) :
    Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Text(selectedDate == null
                ? 'Nenhuma data selecionada!'
                : 'Data selecionada: ${DateFormat('dd/MM/y').format(
                selectedDate!)}'),
          ),
          OutlinedButton(
              onPressed: () => _showDatePicker(context),
              child: Text(
                'Selecione uma data',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }
}
