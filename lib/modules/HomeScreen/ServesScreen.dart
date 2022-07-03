import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smartqueue/Models/Branch-models.dart';
import 'package:smartqueue/Models/ServicesModel.dart';
import 'package:smartqueue/database/DioHelper.dart';
import 'package:smartqueue/modules/HomeScreen/ReservationScreen.dart';

import '../../Models/addReservationModel.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({
    Key? key,
    required this.branch,
  }) : super(key: key);
  final Branch branch;

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  void initState() {
    super.initState();
    _getServices();
  }

  bool isLoading = true;
  List<ServiceModel> services = [];
  _getServices() async {
    DioHelper.postData(
        path: 'get-services',
        data: FormData.fromMap({
          'id': widget.branch.id,
        })).then((value) {
      dynamic data = json.decode(value.data.substring(22));
      for (var item in data['Service']) {
        services.add(ServiceModel.fromJson(item));
      }
      setState(() {
        isLoading = false;
      });
    }).catchError((err, trace) {
      print(err);
      print(trace);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Service'),
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Column(
                  children: [
                    SizedBox(height: 90,),
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .6),
                          ])),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Reservation(
                                branch: widget.branch,
                                serviceId: services[index].id,
                              ),
                            ),
                          );
                        },
                        child:  Center(
                          child: Expanded(
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                services[index].name,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
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

showAlertDialog(Data model, ctx, location) {
  // Create button
  Widget okButton = Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(colors: [
          Color.fromRGBO(143, 148, 251, 1),
          Color.fromRGBO(143, 148, 251, .6),
        ])),
    child: MaterialButton(
      onPressed: () {
        /* Navigator.push(
            ctx,
            MaterialPageRoute(
              builder: (context) => Reservation(
              ),
            ));*/ /* Navigator.push(context, MaterialPageRoute(builder: (context) => Nav_Bar()));*/
      },
      child: const Center(
        child: Text(
          "OK",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
  /*FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );*/

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Reservation"),
    content: SizedBox(
      height: 150,
      child: Column(
        children: [
          Text(
            "Your Turn: ${model.turn} ",
          ),
          const SizedBox(
            height: 15,
          ),
          Text("Current Reservation:${model.currentReservation}"),
          const SizedBox(
            height: 15,
          ),
          Text(location),
        ],
      ),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: ctx,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
