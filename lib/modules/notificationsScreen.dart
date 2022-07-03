import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartqueue/Models/NotificationModel.dart';
import 'package:smartqueue/cubit/NotificationCuit/notification_cubit.dart';



class notificationsScreen extends StatefulWidget {
  static const routePass = 'bookDetailsScreen';

  @override
  State<notificationsScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<notificationsScreen> {
  @override
  void initState() {
    super.initState();
    NotificationCubit.get(context).getNotificationData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
/*    final bookId = ModalRoute.of(context)!.settings.arguments as int;*/
    /*  var model = BranchesCubit.get(context).branchesModel!.branches;*/
    /* final selecteBook = model!.firstWhere((element) => element.id == bookId);*/

    return BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {},
        builder: (
          context,
          state,
        ) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Notification'),
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
                  condition: state is NotificationSucssesState,
                  builder: (context) => ListView.builder(
                        itemCount:
                            NotificationCubit.get(context).notification.length,
                        itemBuilder: (context, index) => getReseItem(
                            NotificationCubit.get(context).notification[index],
                            context),
                      ),
                  fallback: (context) =>
                      const Center(child: CircularProgressIndicator())));
        });
  }
}

Widget getReseItem(NotificationModel model, ctx) => InkWell(
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
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40.0,
                child: Image.asset('assets/images/newlogo.png',
                    width: 120, height: 120),
                backgroundColor: Colors.transparent,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your ${model.title}",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${model.body}",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      model.createdAt!,
                      style: const TextStyle(
                        fontSize: 9,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Column(
              //   children: [
              //     const SizedBox(
              //       height: 7,
              //     ),
              //     Row(
              //       children: [
              //         IconButton(
              //             icon: const Icon(
              //               Icons.arrow_forward_ios,
              //             ),
              //             onPressed: () {}),
              //       ],
              //     ),
              //     const SizedBox(
              //       height: 2,
              //     ),
              //     Column(
              //       children: [
              //         Row(
              //           children: const [

              //           ],
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
