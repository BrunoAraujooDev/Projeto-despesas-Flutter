import 'dart:math';

import 'package:expenses/components/transaction-form.dart';
import 'package:expenses/components/transaction-list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {

  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: 'id', title: 'Compra outback', date: DateTime.now(), value: 310.76),
    Transaction(
        id: 'id2', title: 'Novo mouse', date: DateTime.now(), value: 216.15),
  ];

  void _addTransaction(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(),
        title: title, date: DateTime.now(), value: value);

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}


