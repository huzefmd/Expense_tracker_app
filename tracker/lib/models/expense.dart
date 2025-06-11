import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
final formatter= DateFormat.yMd();
const uuid = Uuid();

enum Category { food, travel, smooking, work }

const catergoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight_takeoff,
  Category.smooking: Icons.smoke_free,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  // The id is generated using the uuid package, which creates a unique identifier for each expense.
  // The title, amount, and date are required parameters for creating an Expense object.
}
