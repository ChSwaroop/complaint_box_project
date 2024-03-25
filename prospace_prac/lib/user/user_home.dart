import 'package:flutter/material.dart';
import 'package:prospace_prac/admins/api_calls.dart';
import 'package:prospace_prac/user/post_query.dart';

class UserHome extends StatefulWidget {

  final id;
  const UserHome({
    required this.id,
    super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

  TextStyle ts = TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {

    return Container(

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
          centerTitle: true,
          title:  Text("Queries" , style: TextStyle(
                color: Colors.white,
                fontSize: 23
              ),),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
             
              SizedBox(height: 10,),
              Expanded(
                
              child: ListView.builder(
          
              itemCount: all_queries["complaints"].length,
              itemBuilder: (context , ind){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)
                  ),
                  child: Container(
                        
                    decoration: BoxDecoration(
                        
                      borderRadius: BorderRadius.circular(12),
                      // border: Border.all(
                      //   color: Color(0xFF61D883)
                      // ), 
                      gradient: LinearGradient(
                        begin: Alignment.topLeft, end: Alignment.bottomRight,
                        colors: [
                        Color(0xFF0B4948),
                        Color(0xFF062525),
                      ])
                    ),
                    child: ListTile(
                              
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      title: Text(all_queries["complaints"][ind]["category"] , style: ts,),
                      subtitle: Text(all_queries["complaints"][ind]["description"] , style: ts,),
                      trailing: (all_queries["complaints"][ind]["status"] == "solved") ?
                       Icon(Icons.check_box , color: Colors.white,) : 
                       Text("pending" , style: ts,),
                    ),
                  ),
                ),
              ); 
            }))
            ],
          ),
        ),
    
        floatingActionButton: FloatingActionButton(
          
          child: Icon(Icons.add , color: Colors.black,),
          backgroundColor: Color(0xFF61D883),
          
          onPressed: ()async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) => PostQuery(id: widget.id)));
          print("Ayyindhi ra");
          setState(() {
            
          });
        }),
      ),
    );
  }
}