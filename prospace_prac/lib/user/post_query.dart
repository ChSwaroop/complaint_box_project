import 'package:flutter/material.dart';
import 'package:prospace_prac/admins/api_calls.dart';
import 'package:prospace_prac/login.dart';

class PostQuery extends StatefulWidget {

  final id;
  const PostQuery({
    required this.id,
    super.key});

  @override
  State<PostQuery> createState() => _PostQueryState();
}

class _PostQueryState extends State<PostQuery> {

  String? initialValue = 'Management';
  TextEditingController des  = TextEditingController();
  bool isLoading = false;

  var items = [
    'Management',
    'Infrastructure',
    'Operational',
    'Coding'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(
            
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [

            
            Color(0xFF062525),
            Color(0xFF0B4948)
          ])
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    Container(
                      height: 50,
                      width: double.infinity-50,
                    
                      child: Container(
                        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFF61D883)
                          )
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: DropdownButton(
                          
                          underline: SizedBox(),
                          borderRadius: BorderRadius.circular(10),
                          style: TextStyle(
                            color: Colors.white
                          ),dropdownColor: Color(0xFF0B4948),
                          value: initialValue,
                          items: [
                              DropdownMenuItem(child: Text('Management'),value: 'Management',),
                              DropdownMenuItem(child: Text('Infrastructure') , value: 'Infrastructure',),
                              DropdownMenuItem(child: Text('Operational') , value: 'Operational',),
                              DropdownMenuItem(child: Text('Coding') , value: 'Coding',),
                          ],
                          onChanged: (newValue){
                            setState(() {
                            initialValue = newValue;
                            });
                          }
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    TextField(
                          
                      maxLines: 12,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      cursorColor: Color(0xFF61D883),
                        controller: des,
                        decoration: InputDecoration(
                          border: border(),
                          focusedBorder: border(),
                          enabledBorder: border(),
                          hintText: "Type Here...",
                          hintStyle: TextStyle(
                            color: Colors.white
                          ),
                          
                        ),
                        
                    ),
                    SizedBox(height: 30,),
                    isLoading ? CircularProgressIndicator(
                      color: Color(0xFF61D883),
                    ) : ElevatedButton(
                      
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF61D883)
                      ),
                      onPressed: ()async{
                      if(des.text.trim().isNotEmpty)
                      {
                          isLoading = true;
                          setState(() {
                            
                          });
                          await post_complaint(initialValue, widget.id, des.text.trim());
                          await getAll();
                          setState(() {
                            
                          });
                          isLoading = false;
                          Navigator.pop(context);
                      }
                      else print('Not filled');
                    }, child:Text("Submit" , style: TextStyle(
                      color: Color(0xFF062525)
                    ),))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}