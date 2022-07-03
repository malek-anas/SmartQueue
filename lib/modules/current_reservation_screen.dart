import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/getReservationModel.dart';
import '../cubit/getReservation/get_reservation_cubit.dart';
import 'HomeScreen/readQr.dart';

class CurrentReservationScreen extends StatefulWidget {
  static const routePass = 'bookDetailsScreen';

  @override
  State<CurrentReservationScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<CurrentReservationScreen> {
  @override
  void initState() {
    super.initState();
    GetReservationCubit.get(context).getReservationData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
/*    final bookId = ModalRoute.of(context)!.settings.arguments as int;*/
    /*  var model = BranchesCubit.get(context).branchesModel!.branches;*/
    /* final selecteBook = model!.firstWhere((element) => element.id == bookId);*/

    return BlocConsumer<GetReservationCubit, GetReservationState>(
        listener: (context, state) {},
        builder: (
          context,
          state,
        ) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Current Reservation'),
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
                actions: const [],
              ),

              //drawer: const MyDrawer(),
              body: ConditionalBuilder(
                  condition: state is GetReservationSucssesState,
                  builder: (context) => ListView.builder(
                        itemCount: GetReservationCubit.get(context)
                            .reservations
                            .length,
                        itemBuilder: (context, index) => getReseItem(
                            GetReservationCubit.get(context)
                                .reservations[index],
                            context),
                      ),
                  fallback: (context) =>
                      const Center(child: CircularProgressIndicator())));
        });
  }
}

Widget getReseItem(GetReservationModel model, ctx) => InkWell(
      //final fashionId = ModalRoute.of(ctx)!.settings.arguments.toString();
      onTap: () {
        //HomeCubit.get(ctx).getBookDetails(model.id);
        //navigateTo(ctx, BookDetailsScreen());
        /* Navigator.pushNamed(ctx, BanksDetailsScreen.routePass,
        arguments: model.id);*/
        /*   Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => Reservation(
              branch: model,
            ),
          ),
        );*/
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 15,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Reservation place: ${model.branch.name}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Reservation service: ${model.serviceName}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your Trun: ${model.turn} ",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        icon: const Icon(Icons.qr_code),
                        onPressed: () {
                          Navigator.push(
                              ctx,
                              MaterialPageRoute(
                                  builder: (context) => ScanScreen(
                                        placeName: model.branch.name,
                                        turn: model.turn,
                                        serviceName: model.serviceName,
                                      )));
                        })
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Current Reservation: ${model.currentReservation}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
