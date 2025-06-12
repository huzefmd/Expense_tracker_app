import 'package:flutter/material.dart';
import 'package:tracker/expenses_list.dart';
import 'package:tracker/models/expense.dart';
import 'package:tracker/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _regesterExpenses = [
    Expense(
      title: "Smooking",
      amount: 1000,
      date: DateTime.now(),
      category: Category.smooking,
    ),
    Expense(
      title: "Food",
      amount: 5000,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Trip to Dubai",
      amount: 100,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(onAddExpense: _addExpenses);
      },
    );
  }

  void _addExpenses(Expense expense) {
    setState(() {
      print("New Expense Added");
      _regesterExpenses.add(expense);
    });
  }

  void _removeExpenses(Expense expense) {
    final expenseIndex = _regesterExpenses.indexOf(expense);
    setState(() {
      _regesterExpenses.remove(expense);
    });

    // ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            print("undo pressed");
            setState(() {
              _regesterExpenses.insert(expenseIndex, expense);
            });
          },
        ),
        content: Text("Expense Deleted!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text("no expenses fond start adding some "),
    );

    if (_regesterExpenses.isNotEmpty) {
     mainContent= ExpensesList(
        expenses: _regesterExpenses,
        onRemoveExpense: _removeExpenses,
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add)),
        ],
        title: Text("Expenses Tracker"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Text("Expenses Tracker"),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
