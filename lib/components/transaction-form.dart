import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptive_date_picker.dart';
import 'package:expenses/components/adaptive_text_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0.0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate!);
  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            AdaptiveTextInput(
              controller: _titleController,
              label:  'Título',
              onSubmit: (_) => _submitForm(),
            ),
            AdaptiveTextInput(
              controller: _valueController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              label:  'Valor R\$',
              onSubmit: (_) => _submitForm(),
            ),
            AdaptiveDatePicker(
              selectedDate: _selectedDate,
              onChangedTime: (newDate){
                setState(() {
                  _selectedDate = newDate;
                });
              },
            ),
            AdaptiveButton(
              label: 'Nova transação',
              onPressed: _submitForm,
            )
          ],
        ),
      ),
    );
  }
}
