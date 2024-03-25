import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prospace_prac/admins/admin.dart';
import 'package:prospace_prac/admins/api_calls.dart';
import 'package:prospace_prac/user/user_home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final key = GlobalKey<FormState>();
  TextEditingController id = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isLoading = false;

  void toast(String msg) {

     Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        // timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF0B4948), Color(0xFF062525)
          ])
        ),
        
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text("Login Screen"),
            elevation: 0,
          ),
          
          body: Form(
          
            key: key,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  TextFormField(

                    cursorColor: Color(0xFF61D883),
                    style: TextStyle(
                      color: Color(0xFF61D883)
                    ),
                    decoration: InputDecoration(

                      label: Text("ID"),

                        border: border(),
                        focusedBorder: border(),
                        enabledBorder:border() ,
                        hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xFF61D883)
                        )
                    ),
                    controller: id,
                    validator: ((val)=> (val!.isEmpty) ? "Enter the ID" : null),
                  ),
            
                  SizedBox(height: 20,),
            
                  TextFormField(

                    cursorColor: Color(0xFF61D883),
                    style: TextStyle(
                      color: Color(0xFF61D883)
                    ),
                    decoration: InputDecoration(

                        label: Text("Password"),
                        border: border(),
                        focusedBorder: border(),
                        enabledBorder:border() ,
                        hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xFF61D883)
                        )
                    ),
                    controller: pass,
                    validator: ((val)=> (val!.isEmpty) ? "Enter the password" : null),
                  ),
            
                  SizedBox(height: 20,),
                  (isLoading) ? CircularProgressIndicator(
                    color: Color(0xFF61D883),
                  ) : ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF61D883)
                    ),
                    onPressed: ()async {
                      if(key.currentState!.validate()){
                        isLoading = true;
                        setState(() {
                          
                        });
                        //check for correct credentials
                        await loginUser(id.text.trim(), pass.text.trim());
                        await getAll();
                        isLoading = false;
                        setState(() {
                          
                        });
                        if(user_data.isNotEmpty){
                            if(id.text.trim() == "Coding" || id.text.trim() == "Operational" || id.text.trim() == "Infrastructure" || id.text.trim() == "Management"){
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => AdminPage(id: id.text.trim()))));
                            }
                            else{
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => UserHome(id: id.text.trim(),)))); 
                            }
                        }
                        else{
                            // toast("User Not Found");
                        }
                      }
            
                  }, child: Text('Submit' , style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),)),
                  SizedBox(height: 30,),
                  user_data.isEmpty ? Text('User not found' , style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),) : Text(''),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder border(){

  return OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFF61D883)
      ),
      borderRadius: BorderRadius.circular(12)
  );
}