import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:prospace_prac/api.dart';


  Map all_queries = {};
  Map user_data = {};

  Future<void> post_complaint(String? category , String id , String des) async{

      print("Called post");
      var response = await http.post(Uri.parse(add_complaint) ,
      headers: {
        "content-type": "application/json"
      },
        body: jsonEncode({
          "id":id,
          "category": category,
          "des": des,
          "status": "unsolved",
        })
      );

      if(response.statusCode == 200){

          print(response.body);
      }

  }

  Future getAll() async{

    print('called getAll');
    
    var response = await http.get(Uri.parse(get_all));
    // print(response.body);

    if(response.statusCode == 200){
      
        all_queries = jsonDecode(response.body);
        // print(all_queries);
    }
    // return null;
  }

Future<void> solve_query(var _id , int ind) async{

    try{
      print(_id);
      var url = "${solved_query}/${_id}";
      print(url);
      var response = await http.put(Uri.parse(url));
      all_queries["complaints"][ind]["status"] = "solved";
    }
    catch(err){
        print(err);
    }
}

Future<void> acc_query(var _id , int ind) async{

    try{
      print(_id);
      var url = "${accept_query}/${_id}";
      print(url);
      var response = await http.put(Uri.parse(url));
      all_queries["complaints"][ind]["status"] = "accepted";
      print(response.body);
    }
    catch(err){
        print(err);
    }
}

Future<void> loginUser(String id , String pass) async{

    try{
      print("Login called");

      var response = await http.post(Uri.parse(login) , 
        headers: {
          "content-type": "application/json"
        },
        body: jsonEncode({
          "id" : id,
          "password": pass
        })
      );
      print(response.body);
  
      if(response.statusCode == 200){
        user_data = jsonDecode(response.body);
        print("User Data: ${user_data}");
      }

    }
    catch(err){
        print(err);
    }
}

class MyHttp extends HttpOverrides{

  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
                ..badCertificateCallback=(cert , host , port) => true;
  }
}