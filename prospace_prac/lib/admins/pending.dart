import 'package:flutter/material.dart';
import 'package:prospace_prac/admins/api_calls.dart';
import 'package:prospace_prac/admins/data.dart';

class AllList extends StatefulWidget {

  final category;
  const AllList({required this.category , super.key});

  @override
  State<AllList> createState() => _AllListState();
}

class _AllListState extends State<AllList> {

  // Api_Class apclass = new Api_Class();
  
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    print(all_queries);
    print(widget.category);
  }
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
            child: ((all_queries["complaints"][ind]["status"] == "accepted") && (all_queries["complaints"][ind]["category"] == widget.category)) ? Container(
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
                    await solve_query(all_queries["complaints"][ind]["_id"] , ind);
                    setState(() {
                      
                    });
                  },
                  child: Text("Done" , style: ts,)
                ),
              ),
            ): null,
          );
    });
  }
}