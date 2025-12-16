import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid= Uuid();
enum Category{leisure,home, work,office}

const categoryicons={
  Category.leisure: Icons.restaurant_menu,
  Category.home:Icons.home,
  Category.office: Icons.local_post_office,
  Category.work: Icons.work
};
final fomatter= DateFormat.yMd();

class Expense {



  Expense({
    required this.title,
    required this.category,
  required this.amount,
    required this.date

    ,
    Superkey
  }):id=uuid.v4();



  final String title;
  final double amount;
  final DateTime date;
  final String id;
  final Category category;

  String get formatteddate{
    return fomatter.format(date);
  }



}