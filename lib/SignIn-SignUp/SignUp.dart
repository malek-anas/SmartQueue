import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartqueue/cubit/Auth-cubit/states.dart';
import '../cubit/Auth-cubit/cubit.dart';
import '../database/CacheHelper.dart';
import '../intro/WelcomeBage.dart';


class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Controllers
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

// Controllers
  TextEditingController name = new TextEditingController();

  TextEditingController email = new TextEditingController();

  TextEditingController phonenumber = new TextEditingController();

  TextEditingController password = new TextEditingController();

  TextEditingController confirmpassword = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

/*signup()async{
    if(formstatesignup.currentState.validate()){
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);

      if(result != null)
      {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignIn()),
        );
      }
    }else{
      print('please try later');
    }
  }*/
  bool _isObscure = true;
  bool _isObscure1 = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
      listener:(context, state) {
      if (_formkey.currentState!.validate()) {
        if(state is SignUpSucssesState){
          if(state.authModel.message=="success message"){
            CacheHelper.saveData(key: 'token', value: true).then(
                    (value) =>
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Welcome())));
          }
        };
      }}
      ,builder: (context,state){
      return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.fill
                        )
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child:  Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/light-1.png')
                                )
                            ),
                          ),
                        ),
                        Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/light-2.png')
                                )
                            ),
                          ),
                        ),
                        Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child:  Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/clock.png')
                                )
                            ),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Center(
                              child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child:
                    Column(
                      children: <Widget>[
                         Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10)
                                )
                              ]
                          ),
                          child: Form(
                            key: _formkey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[100]!))
                                  ),
                                  child: TextFormField(
                                    validator: (value){if(value!.isEmpty){return 'please enter your name';}
                                    if (value.length < 6) {
                                      return 'The name you entered is less than 6 characters';
                                    }},
                                    controller: name,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Name  ",
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[100]!))
                                  ),
                                  child: TextFormField(
                                    validator: (value){if(value!.isEmpty){return 'please enter your email';}
                                    if (value.length < 6) {
                                      return 'The name you entered is less than 6 characters';
                                    }},
                                    controller: email,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email  ",
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[100]!))
                                  ),
                                  child: TextFormField(
                                    validator: (value){if(value!.trim().isEmpty){return 'please enter your phone';}},
                                    controller: phonenumber,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Phone number",
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return 'please enter your password';
                                      }
                                      if (value.trim().length < 8) {
                                        return 'Password cannot be less than 8 characters';
                                      }
                                    },
                                    controller: password,
                                    obscureText: _isObscure,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        prefix: Icon(Icons.lock,color: Colors.deepPurple,),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isObscure ? Icons.visibility : Icons.visibility_off,
                                            color: Colors.deepPurple,),
                                          onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                          },
                                        ),
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    validator: (value){if(value!.isEmpty){return 'please confirm your password';}
                                    if (value != password.text) {
                                      return 'Password does not match';}
                                    },
                                    controller: confirmpassword,
                                    obscureText: _isObscure1,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefix: Icon(Icons.lock,color: Colors.deepPurple,),
                                        hintText: "Confirm Password",
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isObscure1 ? Icons.visibility : Icons.visibility_off,
                                            color: Colors.deepPurple,),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure1 = !_isObscure1;
                                            });
                                          },
                                        ),
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                         Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ]
                              )
                          ),
                          child: Center(
                            child:  Container(
                              height: 50,
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
                               onPressed: (){AuthCubit.get(context).userRegister(name:name.text, email: email.text, password: password.text,phone: phonenumber.text,);} ,

                                child: Center(
                                  child: Text("SignUp", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
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


    },) ;


  }
}

