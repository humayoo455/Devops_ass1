import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g/Widget/expenseitems.dart';
import 'package:g/modal/expense.dart';
import 'package:g/modal/nexexpense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> regExpenses=[
    Expense(title: "ALi", category: Category.leisure, amount: 7, date: DateTime.now()),
    Expense(title: "ALi", category: Category.leisure, amount: 7, date: DateTime.now())
  ];

  void openBottomSheet(){
    showModalBottomSheet(context: context, builder:(ctx,)=> newexpense(addexpense));
  }
  void addexpense(Expense expense){
    setState(() {
      regExpenses.add(expense);
    });

  }
  void RemoveExpense(Expense expense){

    final regitemindex= regExpenses.indexOf(expense);
    setState(() {
      regExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 8),
        content: Text("Its deleted"),
    action: SnackBarAction(label: "Undo", onPressed: (){
      setState(() {
        regExpenses.insert(regitemindex, expense);
      });

    }),)
    );
  }
  @override
  Widget build(BuildContext context) {
    Widget maincontent=Center(child: Text("No item"));
    if(regExpenses.isNotEmpty) {
      setState(() {
        maincontent=expenseitems(regExpenses ,RemoveExpense);
      });
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("Expense App"),
        actions: [IconButton(onPressed: openBottomSheet, icon: Icon(Icons.add))],
      ),
      body:
      Column(

        children: [
          Text("My Expense App",),

           Expanded(child: maincontent),
        ],
      ),
    );
  }
}
