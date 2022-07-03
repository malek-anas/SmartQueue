import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartqueue/database/CacheHelper.dart';
import 'package:smartqueue/modules/more/ChatBot.dart';
import 'package:smartqueue/modules/more/SittingsPage.dart';
import '../../SignIn-SignUp/SignIn.dart';
import 'Profile.dart';

class moreScreen extends StatefulWidget {
  @override
  _moreScreenState createState() => _moreScreenState();
}

class _moreScreenState extends State<moreScreen> {
  signout() async {
    CacheHelper.removeData(key: 'token');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('More'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color.fromRGBO(143, 148, 251, 1),
                Color.fromRGBO(143, 148, 251, .6),
              ])),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Column(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/head.png'))),
                ),
                const SizedBox(
                  height: 120,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.deepPurple,
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Colors.grey[200],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.supervised_user_circle,
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Text("Profile")),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.deepPurple,
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Colors.grey[200],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  ChatBot()));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.chat,
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Text("Chat")),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.deepPurple,
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Colors.grey[200],
                    ),
                    onPressed: signout,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.logout,
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Text("Logout")),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
