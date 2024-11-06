import 'package:flutter/material.dart';
import "package:expenses_tracker/model/expense.dart";

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onDeleteExpense});
  final List<Expense> expenses;
  final Function(Expense) onDeleteExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final expense = expenses[index];
        return Dismissible(
          key: ValueKey(expense.id),
          direction: DismissDirection.endToStart,
          onDismissed: (_) {
            onDeleteExpense(expense);
          },
          background: Container(
            color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Icon(Icons.delete, color: Colors.white)]),
          ),
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(
                getCatgoryIcon(expense.category),
              ),
              title: Text(expense.title),
              subtitle:
                  Text("${expense.category.name}  ${expense.formatedDate}"),
              trailing: Text("\$${expense.amount.toStringAsFixed(2)}"),
            ),
          ),
        );
      },
      itemCount: expenses.length,
    );
  }
}
