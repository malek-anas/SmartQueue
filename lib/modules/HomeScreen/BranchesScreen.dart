import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:smartqueue/modules/HomeScreen/ServesScreen.dart';
import '../../Models/Branch-models.dart';
import '../../cubit/branch-cubit/branches_cubit.dart';

class BranchesScreen extends StatefulWidget {
  static const routePass = 'bookDetailsScreen';
  const BranchesScreen({Key? key, required this.bankId}) : super(key: key);
  final int bankId;

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen> {
  @override
  void initState() {
    super.initState();
    BranchesCubit.get(context).getBranchesData(widget.bankId);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
/*    final bookId = ModalRoute.of(context)!.settings.arguments as int;*/
    /*  var model = BranchesCubit.get(context).branchesModel!.branches;*/
    /* final selecteBook = model!.firstWhere((element) => element.id == bookId);*/
    return BlocConsumer<BranchesCubit, BranchesState>(
        listener: (context, state) {},
        builder: (
          context,
          state,
        ) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Branches'),
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
              condition: state is BranchesSucssesState,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: BranchesCubit.get(context)
                      .branchesModel!
                      .branches!
                      .length,
                  itemBuilder: (context, index) => branchItem(
                    BranchesCubit.get(context).branchesModel!.branches![index],
                    context,
                  ),
                ),
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }
}

Widget branchItem(Branch model, ctx) => InkWell(
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                          isFavorite: model.isFav,
                          valueChanged: (_isFavorite) {
                            BranchesCubit.get(ctx)
                                .changeFavState(model.id, _isFavorite);
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

      /*Container(
    // //color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Container(
    child: Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
  elevation: 25,
  child: InkWell(
    child: Column(
      children: [
        Container(
          height: 200,
          child: Hero(
            tag: model.id!,
            child: Image(
              image: NetworkImage(model.image!),
              width: double.infinity,

            ),
          ),
        ),
        Text(model.name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(ctx).textTheme.subtitle2),
      ],
    ),
  ),
),
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(25),
// color: Colors.deepPurple,
),
),

        */ /*Card(
          child: InkWell(
            child: Column(
              children: [
                Container(
                  height: 200,
                  child: Hero(
                    tag: model.id!,
                    child: Image(
                      image: NetworkImage(model.image!),
                      width: double.infinity,

                    ),
                  ),
                ),
                Text(model.name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(ctx).textTheme.subtitle2),
              ],
            ),
          ),
        ),*/ /*
      ],
    ),
  ),*/
    );
