import 'package:expenses/components/chart-bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions, {super.key});

  List<Map<String, Object>> get groupedTransactions{
    return List.generate(7, (index){

      final weekDay = DateTime.now().subtract(
        Duration(days: index)
      );
      
      String firstLetter = DateFormat.E().format(weekDay)[0];

      double totalSum = 0.0;

      for(int i = 0; i < recentTransactions.length; i++){
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;

        if(sameDay && sameYear && sameMonth){
          totalSum += recentTransactions[i].value;
        }
      }

      return {
          'day': firstLetter,
          'value': totalSum,
        };
    }).reversed.toList();
  }

  double get _weekTotalValue{
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            return  Flexible(
              fit: FlexFit.tight,
              child: ChartBar(label: tr['day'].toString(),
                  percentage: _weekTotalValue == 0 ? 0 : (tr['value'] as double) / _weekTotalValue,
                  value: (tr['value'] as double)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
