import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prospace_prac/admins/pending.dart';
import 'package:prospace_prac/admins/api_calls.dart';
import 'package:prospace_prac/admins/data.dart';
import 'package:prospace_prac/admins/solved.dart';
import 'package:prospace_prac/admins/unsolved.dart';
import 'package:http/http.dart' as http;
import 'package:prospace_prac/api.dart';

class AdminPage extends StatefulWidget {

  final id;
  const AdminPage({required this.id , super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> with SingleTickerProviderStateMixin{

  TabController? tb;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tb = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
    
        decoration: BoxDecoration(
            gradient: LinearGradient(
              
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
              Color(0xFF0B4948) , Color(0xFF062525) , 
            ])
          ),
    
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(360),
                    border: Border.all(
                      color: Color(0xFF61D883)
                    )
                  ),
                  child: TabBar(
                    controller: tb,
                    indicator: BoxDecoration(
                      color: Color(0xFF61D883),
                      borderRadius: BorderRadius.circular(360)
                    ),
                    tabs: [
                        Tab(text: "Unsolved",),
                        Tab(text: "Solved",),
                        Tab(text: "Pending",),
                    ]
                  ),
                ),
                SizedBox(height: 30,),
                Expanded(
                  child: TabBarView(
                    controller: tb,
                    children:[
                      
                      UnsolvedList(category: widget.id,),
                      SolvedList(category: widget.id,),
                      AllList(category: widget.id,),
                    ]
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}