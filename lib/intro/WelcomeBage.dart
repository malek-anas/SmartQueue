import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartqueue/modules/HomeScreen/PlacesScreen.dart';

import '../Home/Nav_Bar.dart';
import '../SignIn-SignUp/SignUp.dart';


class Welcome extends StatefulWidget {


  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color.fromRGBO(143, 148, 251, 1),
                    Color.fromRGBO(143, 148, 251, .6),
                  ])
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child:
          Column(
            children: [
              SizedBox(height: 10,),
            Text('Welcome',style: TextStyle(fontSize: 50,color: Colors.deepPurple),),
              SizedBox(height: 100,),
               Image(image: (
                  AssetImage('assets/images/Select-amico.png')
              )
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ]
                    )
                ),
                child: MaterialButton(
                  onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context) => Nav_Bar()));

                  },
                  child: Center(
                    child: Text("Choose a service", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
