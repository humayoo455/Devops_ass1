import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g/modal/expense.dart';

class expenselist extends StatelessWidget {
  const expenselist(this.expense,{super.key});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return
      Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Card(

        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(expense.title),
              Row(children: [
                Text(expense.amount.toString()),
                Spacer(),
                Row(children: [
                  Icon(categoryicons[expense.category]),
                  Text(fomatter.format(expense.date))

                ],)
              ],)
            ],
          ),
        )
      )
        ,);
  }
}
