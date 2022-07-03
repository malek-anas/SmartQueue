import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smartqueue/Models/Branch-models.dart';

import '../../Models/addReservationModel.dart';
import '../../cubit/Reservation/reservation_cubit.dart';

class Reservation extends StatefulWidget {
  const Reservation({
    Key? key,
    required this.branch,
    required this.serviceId,
  }) : super(key: key);
  final Branch branch;
  final int serviceId;

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  @override
  void initState() {
    super.initState();
    // ReservationCubit.post(context).addReservationData(widget.branchId);
  }

  // 'National Bank Of Egypt'
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Reservation'),
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
          body: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: const AssetImage(
            //       'assets/images/NBE0.png',
            //     ),
            //     colorFilter: ColorFilter.mode(
            //         Colors.white.withOpacity(0.6), BlendMode.modulate),
            //   ),
            // ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  /* const Text(
                    'The official working hours of the bank start from 08:00 AM until 02:00 PM',
                    style: TextStyle(fontSize: 20),
                  ),*/
                  Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 300,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
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
                                ReservationCubit.post(context)
                                    .addReservationData(
                                        widget.branch.id,
                                        context,
                                        widget.branch.location,
                                        widget.serviceId);
                              },
                              child: const Center(
                                child: Text(
                                  "Book Your Turn",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

showAlertDialog(Data model, ctx, location, message) {
  // Create button
  Widget okButton = Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: const LinearGradient(colors: [
        Color.fromRGBO(143, 148, 251, 1),
        Color.fromRGBO(143, 148, 251, .6),
      ]),
    ),
    child: MaterialButton(
      onPressed: () {
        Navigator.of(ctx)
            .pop(); /* Navigator.push(context, MaterialPageRoute(builder: (context) => Nav_Bar()));*/
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
      height: 175,
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
          const SizedBox(height: 10),
          if (message == 'you have reserved before') Text(message),
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
