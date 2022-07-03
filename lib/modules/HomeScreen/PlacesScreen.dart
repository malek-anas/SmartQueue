import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smartqueue/Models/Places-Models.dart';

import '../../Models/Places-Models.dart';
import '../../cubit/Places-cubit/places_cubit.dart';
import 'BranchesScreen.dart';



class PlacesScreen extends StatefulWidget {
  static const routePass = 'bookDetailsScreen';
  final int catId;
  const PlacesScreen({
    Key? key,
    required this.catId,
  }) : super(key: key);
  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  @override
  void initState() {
    super.initState();
    PlacesCubit.get(context).getPlacesData(widget.catId);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
/*   final placeId = ModalRoute.of(context)!.settings.arguments as int;
    var model = PlacesCubit.get(context).placesModels!.places;
   final selecteplace = model!.firstWhere((element) => element.id == placeId);*/
    return BlocConsumer<PlacesCubit, PlacesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Places'),
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
              //drawer: const MyDrawer(),
              body: ConditionalBuilder(
                  condition: state is PlacesSucssesState,
                  builder: (context) => Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              // Here the height of the container is 45% of our total height
                              height: size.height * .45,
                              decoration: const BoxDecoration(),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: GridView.count(
                                      shrinkWrap: true,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: .80,
                                      children: List.generate(
                                          PlacesCubit.get(context)
                                              .placesModels!
                                              .places!
                                              .length,
                                          (index) => bookItem(
                                              PlacesCubit.get(context)
                                                  .placesModels!
                                                  .places![index],
                                              context)),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                  fallback: (context) =>
                      const Center(child: CircularProgressIndicator())));
        });
  }

  Widget bookItem(Places model, ctx) => InkWell(
        //final fashionId = ModalRoute.of(ctx)!.settings.arguments.toString();
        onTap: () {
          //HomeCubit.get(ctx).getBookDetails(model.id);
          //navigateTo(ctx, BookDetailsScreen());
          /* Navigator.pushNamed(ctx, BanksDetailsScreen.routePass,
        arguments: model.id);*/
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BranchesScreen(
                  bankId: model.id ?? 1,
                ),
              ));
        },
        child: Container(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 25,
            child: InkWell(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image(
                    image: NetworkImage(model.image!),
                    width: 150,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    model.name!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            // color: Colors.deepPurple,
          ),
        ),
      );
}
