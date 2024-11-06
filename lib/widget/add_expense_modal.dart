import 'package:flutter/material.dart';

import "package:expenses_tracker/model/expense.dart";
import "package:intl/intl.dart";

class AddExpenseModal extends StatefulWidget {
  final void Function(Expense) onAddExpense;
  const AddExpenseModal({super.key, required this.onAddExpense});

  @override
  State<AddExpenseModal> createState() {
    return _AddExpenseModalState();
  }
}

class _AddExpenseModalState extends State<AddExpenseModal> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.food;
  DateTime? _selectedDate;

  void _submitExpense(context) {
    print("Title: ${_titleController.text}");
    print("Amount: ${_amountController.text}");
    print("Date: $_selectedDate");
    if (!_formKey.currentState!.validate() || _selectedDate == null) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Please fill all field correctly."),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"))
          ],
        ),
      );
      return;
    }

    final Expense expense = Expense(
      title: _titleController.text,
      amount: double.tryParse(_amountController.text)!,
      category: _selectedCategory,
      date: _selectedDate!,
    );

    widget.onAddExpense(expense);
    Navigator.of(context).pop();
  }

  void _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 50,
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      "Add New Expense",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: "title"),
                      maxLength: 50,
                      validator: (value) => value == null || value.isEmpty
                          ? "Enter a title "
                          : null,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DropdownButtonFormField(
                      value: _selectedCategory,
                      items: Category.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Row(
                                children: [
                                  Icon(
                                    getCatgoryIcon(category),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(category.name)
                                ],
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                      decoration: const InputDecoration(labelText: "Category"),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                        controller: _amountController,
                        decoration: const InputDecoration(labelText: "Amount"),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter an amount";
                          }

                          final amount = double.tryParse(value);
                          if (amount == null || amount < 0) {
                            return "Enter a valid amount greater than 0";
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(_selectedDate == null
                              ? "No Date Chosen"
                              : "Picked Date:${DateFormat("yMd").format(_selectedDate!)}"),
                        ),
                        const Spacer(),
                        const Icon(Icons.date_range),
                        TextButton(
                            onPressed: _pickDate,
                            child: const Text("Choose Date"))
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("Cancel")),
                          ElevatedButton(
                            onPressed: () {
                              _submitExpense(context);
                            },
                            child: const Text("Save Expense"),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        )
      ],
    );
  }
}
