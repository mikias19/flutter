import "package:expenses_tracker/widget/expenses_chart.dart";
import 'package:flutter/material.dart';
import "package:expenses_tracker/data/expenses.dart";
import "package:expenses_tracker/model/expense.dart";
import "package:expenses_tracker/widget/add_expense_modal.dart";
import "package:expenses_tracker/widget/expense_list.dart";
import "package:flutter/widgets.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final List<Expense> expenses = List.from(initialExpenses);
  Expense? _recentlyDeletedExpense;

  void _addExpenses(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void _deleteExpense(Expense expense) {
    setState(() {
      _recentlyDeletedExpense = expense;
      expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${expense.title} removed"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            _undoDelete();
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _undoDelete() {
    if (_recentlyDeletedExpense != null) {
      setState(() {
        expenses.insert(0, _recentlyDeletedExpense!);
      });
      _recentlyDeletedExpense = null;
    }
  }

  void _openAddExpenseModal(BuildContext context) {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => AddExpenseModal(onAddExpense: _addExpenses));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //key: _scaffoldMessengerKey,
        appBar: AppBar(
          title: const Text("Expense Tracker"),
          actions: [
            IconButton(
              onPressed: () {
                _openAddExpenseModal(context);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Column(children: [
          CustomExpenseChart(expenses: expenses),
          Expanded(
              child: ExpenseList(
                  expenses: expenses, onDeleteExpense: _deleteExpense))
        ]));
  }
}
