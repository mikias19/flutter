import "package:expenses_tracker/model/expense.dart";

// Sample list of expenses
final List<Expense> initialExpenses = [
  Expense(
    title: "Groceries",
    category: Category.food,
    date: DateTime.now().subtract(Duration(days: 1)),
    amount: 45.50,
  ),
  Expense(
    title: "Movie Night",
    category: Category.leisure,
    date: DateTime.now().subtract(Duration(days: 2)),
    amount: 15.00,
  ),
  Expense(
    title: "Monthly Metro Pass",
    category: Category.travel,
    date: DateTime.now().subtract(Duration(days: 365)),
    amount: 50.00,
  ),
  Expense(
    title: "Work Lunch",
    category: Category.work,
    date: DateTime.now().subtract(Duration(days: 5)),
    amount: 20.75,
  ),
  Expense(
    title: "Gym Membership",
    category: Category.leisure,
    date: DateTime.now().subtract(Duration(days: 10)),
    amount: 30.00,
  ),
  Expense(
    title: "Dinner with Friends",
    category: Category.food,
    date: DateTime.now().subtract(Duration(days: 6)),
    amount: 60.00,
  ),
];
