import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g/modal/expense.dart';

class newexpense extends StatefulWidget {
  const newexpense(this.newexpenseitem,{super.key});
  final Function(Expense expnse) newexpenseitem;

  @override
  State<newexpense> createState() => _newexpenseState();
}

class _newexpenseState extends State<newexpense> {
  final titlecontroller= TextEditingController();
  final amountecontroller= TextEditingController();
  late var selectedcategoru=Category.office;
  DateTime? pickeddate;
  void datepicker()async{
    var now= DateTime.now();
    var firstdate= DateTime(now.year-1,now.month,now.day);
  final selceteddate=await showDatePicker(context: context, firstDate: firstdate, lastDate: now);
    setState(() {
      pickeddate=selceteddate;
    });
  }
  
  void validate(){

    final amount = double.tryParse(amountecontroller.text);
    final ismaountvalid= amount==null|| amount<=0;
    if (titlecontroller.text.trim()==null|| pickeddate==null|| ismaountvalid)
    {
      showDialog(context: context, builder: (ctx){
        return AlertDialog(
          title: Text("Somme error"),
          content: Text("YOu have some incoorecr data plz correct"),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Okay"))
          ],
        );
      });
      return;
    }

    widget.newexpenseitem(Expense(title: titlecontroller.text, category: selectedcategoru, amount: amount, date: DateTime.now()));
    Navigator.pop(context);


  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    child:
      Column(
        children: [
          TextField(
            maxLength: 50,
            controller: titlecontroller,
            decoration: InputDecoration(
              label: Text("Enter Title"),

            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  maxLength: 50,
                  controller: amountecontroller,
                  decoration: InputDecoration(
                    label: Text("Enter Amount"),

                  ),
                ),
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text(pickeddate==null? "No date selcted" : (fomatter.format(pickeddate!))),
                  IconButton(onPressed: datepicker, icon: Icon(Icons.calendar_month)
                  )],),
              )
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: selectedcategoru,
                  items: Category.values.map((category){

                return DropdownMenuItem(
                  value: category,
                    child: Text(category.name));
              }).toList() ,


                  onChanged: (value){
                  if (value==null){
                    return;
                  }
                  setState(() {
                    selectedcategoru=value;
                  });
                  }),
              Spacer(),
              ElevatedButton(onPressed: validate,
                  child: Text("Save Expense")),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Cancel")),

            ],
          )


        ]



      ),
    );
  }
}



