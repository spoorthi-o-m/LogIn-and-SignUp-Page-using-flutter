//import 'dart:js_util';
import 'home.dart';
import 'signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
final FirebaseAuth _auth=FirebaseAuth.instance;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
 bool _obscureText = true;
 Icon icon = Icon(Icons.visibility);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up page',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
      routes:<String,WidgetBuilder>{
        '/signup':(BuildContext)=>new SignupPage(),
        '/home':(Buildcontext) =>new  Homepage(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('App'),
      ),
      
                    
      body:Center(
            //  image: DecorationImage(image: AssetImage("assets/image1.jpg"), fit: BoxFit.cover),),
       
        
        child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bkg2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
           
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          SizedBox(height:40),
             Container(
              alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text("Sign in",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                  
                ),
                ),
),
Container(
  child:Column(
  children:<Widget>[
    Container(
padding: EdgeInsets.all(20),
child: const TextField(
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
//prefixIcon: const Icon(Icons.lock),
  decoration: InputDecoration(
    
    labelText: 'Password',
    labelStyle: TextStyle(
      fontFamily: 'Times New Roman',
      fontWeight: FontWeight.bold,
      color: Colors.blue,
      fontSize: 20
    ),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.brown),
    )
    
      , suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off
             ), onPressed: () {  
              setState(() {
                _obscureText=!_obscureText;
              });
             },
),),
),),
SizedBox(height:10),

      ],
  )

        ) ,
        SizedBox(height:5),
        Container(
        child:Center( 
    child:ElevatedButton(
      
    child:const Text('Login',textAlign: TextAlign.center),
    
          onPressed:(){

          },
        
        )
        )
        ),
        SizedBox(height:2),
        Container(
          child: Center(
          child:TextButton(
            onPressed: () 
            {
                Navigator.of(context).pushNamed('/signup');
            },
            child:Text("Don't have an account? Sign up")
            )
          ),
        )

         ],
     
      ))));
    
    
  
}
}