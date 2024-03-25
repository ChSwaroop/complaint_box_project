import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prospace_prac/admins/admin.dart';
import 'package:prospace_prac/admins/api_calls.dart';
import 'package:prospace_prac/api.dart';

class Complaints extends StatefulWidget {
  const Complaints({super.key});

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {

  Future<void> post_complaint(String category , String id , String des) async{

      print("Called");
      var response = await http.post(Uri.parse(add_complaint) ,
      headers: {
        "content-type": "application/json"
      },
        body: jsonEncode({
          "id":id,
          "category": category,
          "des": des,
          "isSolved": false,
        })
      );

      if(response.statusCode == 200){

          print(response.body);
      }

  }

  Future<void> get_user_complaints(String id) async{
     
     String url = '${get_user_complaints}/${id}';

     var response = await http.get(Uri.parse(url));

     if(response.statusCode == 200){
      print(response.body);
     }
  }

  TextEditingController category = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController id = TextEditingController();
  // Api_Class apclass = Api_Class();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // DropdownMenu(            
            //   dropdownMenuEntries: [
              
            //   ]
            // )
            SizedBox(height: 20,),
             TextField(
              controller: id,
               decoration: InputDecoration(
                hintText: "ID"
              ),
      
            ),
            SizedBox(height: 20,),
            TextField(
              controller: category,
              decoration: InputDecoration(
                hintText: "Category"
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: des,
               decoration: InputDecoration(
                hintText: "Description"
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                  post_complaint(category.text.trim() , id.text.trim() , des.text.trim());
              },
              child: Text("Send")
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
      
            }, child: Text('Get All')),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: ()async{

              await getAll();
                Navigator.push(context, MaterialPageRoute(builder: ((context) => AdminPage(id: id.text.trim()))));
            },child: Text('Admin')),
          ],
        ),
      ),
    );
  }
}