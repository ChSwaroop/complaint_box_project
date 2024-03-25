import 'package:flutter/material.dart';
import 'package:prospace_prac/admins/api_calls.dart';

class UnsolvedList extends StatefulWidget {

  final category;
  const UnsolvedList({required this.category , super.key});

  @override
  State<UnsolvedList> createState() => _UnsolvedListState();
}

class _UnsolvedListState extends State<UnsolvedList> {

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
            child: (all_queries["complaints"][ind]["status"] == "unsolved" && all_queries["complaints"][ind]["category"] == widget.category) ? Container(
              
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
                 InkWell(
            
                  onTap: ()async {
                    await acc_query(all_queries["complaints"][ind]["_id"] , ind);
                    setState(() {
                      
                    });
                  },
                  child: Text("Accept" , style: ts,)
                ),
              ),
            ):null,
          );
    });
  }
}