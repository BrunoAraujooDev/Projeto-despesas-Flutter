import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final void Function(String)? removeTransaction;
  final Transaction? tr;

   const TransactionItem({Key? key, this.tr, this.removeTransaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Card(
        elevation: 4,
        margin:
        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 30,
            child: Padding(
              padding: EdgeInsets.only(
                top: 10,
                right: 10,
                left: 10,
                bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
              ),
              child: FittedBox(
                child: Text(
                  'R\$${tr!.value.toStringAsFixed(1)}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18 *
                          MediaQuery.of(context).textScaleFactor),
                ),
              ),
            ),
          ),
          title: Text(
            tr!.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(DateFormat('d MMM y').format(tr!.date)),
          trailing: IconButton(
            onPressed: () => removeTransaction!(tr!.id),
            icon: const Icon(Icons.delete),
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }
}
