import 'package:flutter/material.dart';
import 'package:tracker/models/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title,style: TextStyle(color: Colors.red),),
            const SizedBox(height: 4),
            Row(children: [Text('\$${expense.amount.toStringAsFixed(2)}'),
            Spacer(),
            Row(
              children: [
                Icon(catergoryIcons[expense.category], color: Colors.red),
                SizedBox(width: 4),
                Text(expense.formattedDate),
              ],
            )
            ],),
          ],
        ),
      ),
    );
  }
}
