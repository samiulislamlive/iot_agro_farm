import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojectshere/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key : _formkey,

          child: Column(
            children: [
            Image.asset("assets/images/login_flutter2.png",
            fit: BoxFit.cover,
              height: 300,
          ), //Image.asset
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Welcome to IOT Agro Farm",
            style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),

    ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (value)
                        {
                          if(value!.isEmpty)
                            {
                              return "Username cannot be empty";

                            }
                          return null;
                        },
                      onChanged: (value)
                        {
                          name = value;
                          setState(() {
                          });
                        }
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password cannot be empty";
                        }
                        else if(value.length < 7)
                          {
                            return "Password Length should be at least 6 characters";
                          }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),

                    Material(
                      color: Colors.green,
                        borderRadius: BorderRadius.circular(changeButton?50:8),
                      child: InkWell(

                        onTap: () => moveToHome(context),

                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton?50: 150,
                          height: 40,
                          alignment: Alignment.center,
                          child:changeButton?Icon(Icons.done,color:Colors.white)
                              : Text("Login",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold, fontSize: 18,),
                          ),

                          ),
                        ),
                      ),
                  ],
                ),
              )
    ],
    ),
        ),
      )
    );
  }
}