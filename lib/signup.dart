// ignore_for_file: unused_label

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
final db=FirebaseFirestore.instance;
final FirebaseAuth _auth=FirebaseAuth.instance;
class SignupPage extends StatefulWidget{
  @override
  _SignupPageState createState() => _SignupPageState();

  }
  class _SignupPageState extends State<SignupPage>{
    bool _obscureText = true;
 Icon icon = Icon(Icons.visibility);
    final TextEditingController _emailController=TextEditingController();
    final TextEditingController _passwordController=TextEditingController();
    final TextEditingController _nameController=TextEditingController();
    final TextEditingController _pnoController=TextEditingController();
    final TextEditingController _confirmController=TextEditingController();
    late bool _success;
    late String _userEmail;
    late String _name;
    late Long _pno;
    Future<void> createUser()
    async {
      await db.collection("users").doc(_auth.currentUser!.uid).set({
        "Name":_nameController.text,
        "Phone Number":_pnoController.text
        
      });
      print("name:${_nameController.text}");
    }
    void _register() async{
      print("email:${_emailController.text},password:${_passwordController.text}");
      final User? user=(
        await _auth.createUserWithEmailAndPassword(email:_emailController.text, password: _passwordController.text)
      ).user;
      createUser();
      
      if(user!=null){
        setState(() {
          _success=true;
          _userEmail=user.email!;
        });
      }
      else{
        setState(() {
          _success=false;
        });
      }
    }
    @override
    Widget build(BuildContext context){
      return Scaffold(
        body:SafeArea( 
        child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[        
          SizedBox(height:100),
               Container(
              alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text("Sign Up",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                  
                ),
                ),
),
          SizedBox(height:20),
          Container(
padding: EdgeInsets.all(20),
child:  TextField(
  controller: _nameController,
  decoration: InputDecoration(
    labelText: 'Name',
    labelStyle: TextStyle(
      fontFamily: 'Times New Roman',
      fontWeight: FontWeight.bold,
      color: Colors.blue,
      fontSize: 20
    ),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.brown),
    )
      ),
),
),
SizedBox(height:5),
Container(
padding: EdgeInsets.all(20),
child:  TextField(
  controller: _pnoController,
  decoration: InputDecoration(
    labelText: 'Phone Number',
    labelStyle: TextStyle(
      fontFamily: 'Times New Roman',
      fontWeight: FontWeight.bold,
      color: Colors.blue,
      fontSize: 20
    ),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.brown),
    )
      ),
),
),
SizedBox(height:5),


Container(
  child:Column(
  children:<Widget>[
    Container(
padding: EdgeInsets.all(20),
child:  TextFormField(
  controller: _emailController,
  decoration: InputDecoration(
    labelText: 'Email',
    labelStyle: TextStyle(
      fontFamily: 'Times New Roman',
      fontWeight: FontWeight.bold,
      color: Colors.blue,
      fontSize: 20
    ),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.brown),
    )
      ), 
      
),
),
SizedBox(height:5),
Container(
padding: EdgeInsets.all(20),
child: TextField(
  obscureText:_obscureText,
  controller: _passwordController,
  decoration: InputDecoration(
    labelText: 'Password',
    labelStyle: TextStyle(
      fontFamily: 'Times New Roman',
      fontWeight: FontWeight.bold,
      color: Colors.blue,
      fontSize: 20
    ),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.brown),
    
    ) , suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off
             ), onPressed: () {  
              setState(() {
                _obscureText=!_obscureText;
              });
             },
),
    
      ),
),
),
SizedBox(height:5),
Container(
padding: EdgeInsets.all(20),
child: TextFormField(
  obscureText:_obscureText,
  controller: _confirmController,
  validator:(value){
      if(_passwordController.text!=value)
      {return "Passwords dont match";}
    },
  decoration: InputDecoration(
    labelText: 'Confirm Password',
    labelStyle: TextStyle(
      fontFamily: 'Times New Roman',
      fontWeight: FontWeight.bold,
      color: Colors.blue,
      fontSize: 20
    ),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.brown),
    
    ) , suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off
             ), onPressed: () {  
              setState(() {
                _obscureText=!_obscureText;
              });
             },
),
    
      ),
      

),
),

      ],
  )

        ) ,
        SizedBox(height:5),
        Container(
        child:Center( 
    child:ElevatedButton(
      
    child:const Text('Signup',textAlign: TextAlign.center),
    
          onPressed:()async{
            _register();
            Navigator.of(context).pop();
           // Navigator.of(context).pushNamed('/main');
            
          },
        
        )
        )
        ),
        SizedBox(height:2),
        
         ]
    )))
    );
    
    
  
}
}
     