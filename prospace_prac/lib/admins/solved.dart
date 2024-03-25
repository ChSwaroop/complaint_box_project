import 'package:flutter/material.dart';
import 'package:prospace_prac/admins/api_calls.dart';

class SolvedList extends StatefulWidget {

  final category;

  const SolvedList({required this.category , super.key});

  @override
  State<SolvedList> createState() => _SolvedListState();
}

class _SolvedListState extends State<SolvedList> {

  TextStyle ts = TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(

      itemCount: all_queries["complaints"].length,
      itemBuilder: (context , ind){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: (all_queries["complaints"][ind]["status"] == "solved" && all_queries["complaints"][ind]["category"] == widget.category) ? Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
        
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFF61D883)
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft, end: Alignment.bottomRight,
                      colors: [
                      Color(0xFF0B4948),
                      Color(0xFF062525),
                    ])
                  ),
              child: ListTile(
                      
                // tileColor: Color(0XFF61D883),
                // minVerticalPadding: 8,
                shape: RoundedRectangleBorder(
                  
                  borderRadius: BorderRadius.circular(30)
                ),
                title: Text(all_queries["complaints"][ind]["description"] , style: ts,),
                trailing:
                 Icon(Icons.check_box , color: Colors.white,) ,
               
              ),
            ): null);
    });
  }
}