import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:smartqueue/modules/HomeScreen/ServesScreen.dart';
import '../Models/Branch-models.dart';
import '../cubit/FavoritesCubit/favorites_cubit.dart';

class FavoritesScreen extends StatefulWidget {
  static const routePass = 'bookDetailsScreen';

  @override
  State<FavoritesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    FavoritesCubit.get(context).getFavoritesData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
/*    final bookId = ModalRoute.of(context)!.settings.arguments as int;*/
    /*  var model = BranchesCubit.get(context).branchesModel!.branches;*/
    /* final selecteBook = model!.firstWhere((element) => element.id == bookId);*/
    Widget favoritesItem(Branch model, ctx) => InkWell(
          //final fashionId = ModalRoute.of(ctx)!.settings.arguments.toString();
          onTap: () {
            //HomeCubit.get(ctx).getBookDetails(model.id);
            //navigateTo(ctx, BookDetailsScreen());
            /* Navigator.pushNamed(ctx, BanksDetailsScreen.routePass,
        arguments: model.id);*/
            Navigator.push(
              ctx,
              MaterialPageRoute(
                builder: (context) => ServiceScreen(
                  branch: model,
                ),
              ),
            );
          },
          child: Container(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 4,
              child: InkWell(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            // const SizedBox(
                            //   width: 100,
                            // ),
                            Image(
                              image: NetworkImage(model.image!),
                              width: 150,
                            ),
                            // const SizedBox(
                            //   width: 53,
                            // ),
                            const Spacer(),
                            FavoriteButton(
                              isFavorite: true,
                              valueChanged: (_isFavorite) {
                                FavoritesCubit.get(ctx).favs.removeWhere(
                                    (element) => element.branch.id == model.id);
                                setState(() {});
                                FavoritesCubit.get(ctx).deleteFav(model.id);
                                // BranchesCubit.get(ctx)
                                //     .changeFavState(model.id, _isFavorite);
                                // if (_isFavorite) {
                                //   // add fav
                                // } else {
                                //   // delete fav
                                // }
                                //
                                print('Is Favorite $_isFavorite)');
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      model.name!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Text(
                            "Location:",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ReadMoreText(
                              model.location!,
                              trimLines: 2,
                              style: const TextStyle(color: Colors.black),
                              colorClickableText: Colors.pink,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                              moreStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ],
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
    return BlocConsumer<FavoritesCubit, FavoritesState>(
        listener: (context, state) {},
        builder: (
          context,
          state,
        ) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Favorites'),
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
                  condition: state is FavoritesSucssesState,
                  builder: (context) => ListView.builder(
                        itemCount: FavoritesCubit.get(context).favs.length,
                        itemBuilder: (context, index) => favoritesItem(
                            FavoritesCubit.get(context).favs[index].branch,
                            context),
                      ),
                  fallback: (context) =>
                      const Center(child: CircularProgressIndicator())));
        });
  }
}
