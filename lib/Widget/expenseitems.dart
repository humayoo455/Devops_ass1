import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g/Widget/expenselist.dart';
import 'package:g/modal/expense.dart';

class expenseitems extends StatelessWidget {
  const expenseitems(this.expenseit,this.removeitem,{super.key});
  final Function(Expense expense) removeitem;
  final List<Expense> expenseit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    itemCount: expenseit.length,
    itemBuilder: (ctx,index)
    {
      return Dismissible
        (
        background: Container(
          margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            color: Theme.of(context).colorScheme.error),
          key:ValueKey(expenseit[index]),
      onDismissed: (Direction){
        removeitem(expenseit[index]);
      },
      child: expenselist(expenseit[index]));
  });
  }
}
