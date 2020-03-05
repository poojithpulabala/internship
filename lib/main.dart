import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flare_dart/actor.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset:false,
        backgroundColor:Color.fromARGB(30, 50, 56, 1),
        body: LoginScreen(),
      )
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String pass="admin";
  String animationType="idle";



  final passwordController =TextEditingController();
  final passwordFocusNode=FocusNode();


@override
void initState() {
    // TODO: implement initState
   
      passwordFocusNode.addListener((){
        if(passwordFocusNode.hasFocus){
          setState(() {
            animationType="test";
          });
        }
        else{
          setState(() {
            animationType="idle";
          });
        }


      });
       super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height:60,
          width: 200,
        ),

        Center(
          child: Container(
            height: 250,
            width: 250,

            child: CircleAvatar(
              child: ClipOval(
                child: new FlareActor("assets/Teddy.flr" , alignment:Alignment.center, fit: BoxFit.contain,animation: animationType, ),
              ),
              backgroundColor: Colors.white,
            )
          ),
        ),

        SizedBox(
          height:20,
          width: 10,
        ),

        Container(
          height: 140,
          width: 530,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white
          ),


          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(border:InputBorder.none,hintText:"User name",contentPadding:EdgeInsets.all(20)),
                ),
            Divider(),

                TextFormField(
                  obscureText: true,
                decoration: InputDecoration(border:InputBorder.none,hintText:"Password",contentPadding:EdgeInsets.all(20)),
                controller: passwordController,
                focusNode: passwordFocusNode,
                ),
            ],
          ),
        ),

        Container(
          width: 400,
          height: 70,
          padding: EdgeInsets.only(top:20),
         child: RaisedButton(
           color: Colors.pink,
            child: Text("Submit",style: TextStyle(color: Colors.white),),

          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30),
          ),
          onPressed:(){
            if(passwordController.text.compareTo(pass)==0){
              setState(() {
                animationType="success";
              });
            }
            else{
              setState(() {
                animationType="fail";
              });
            }

          }
         ),
        ),



      ],
    );
  }
}