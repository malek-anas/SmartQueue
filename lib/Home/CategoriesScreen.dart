import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smartqueue/Models/Categories.models.dart';
import 'package:smartqueue/Models/searchmodel.dart';
import '../Models/Categories.models.dart';
import '../database/DioHelper.dart';
import '../database/EndPoint.dart';
import '../helpers/debouncer.dart';
import '../modules/HomeScreen/BranchesScreen.dart';
import '../modules/HomeScreen/PlacesScreen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoriesModel? categoriesModel;
  List<SearchModel> result = [];
  bool isSearch = false;
  var searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getCategoriesData();
  }

/////
  void getCategoriesData() {
    DioHelper.getData(
      path: CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      setState(() {});
    }).catchError((error) {
      print(error.toString());
    });
  }

  void search(String name) {
    result.clear();
    setState(() {
      isSearch = true;
    });
    DioHelper.getData(
      path: SEARCH + "/$name",
    ).then((value) {
      dynamic json3 = json.decode(value.data.substring(22));
      for (var item in json3) {
        result.add(SearchModel.fromJson(item));
      }
      setState(() {});
    }).catchError((error, trace) {
      print(trace);
      print(error.toString());
    });
  }

  var debouncer = Debouncer(milliseconds: 5000);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        //drawer: const MyDrawer(),
        body: categoriesModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Color.fromRGBO(143, 148, 251, .6),
                            Color.fromRGBO(143, 148, 251, 1),
                          ]),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30)),
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Find Your',
                          style:
                              TextStyle(color: Colors.deepPurple, fontSize: 25),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Service',
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(244, 243, 243, 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: TextField(
                            controller: searchController,
                            onChanged: (value) {
                              search(value);
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      debouncer.run(() {
                                        setState(() {
                                          isSearch = false;
                                        });
                                        searchController.clear();
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.clear,
                                      color: Colors.black87,
                                    )),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.black87,
                                ),
                                hintText: "Search you're looking for",
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 15)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  isSearch
                      ? Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 15,
                              childAspectRatio: .85,
                              children: List.generate(
                                  result.length,
                                  (index) =>
                                      searchItem(result[index], context)),
                            ),
                          ),
                        )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 15,
                              childAspectRatio: .85,
                              children: List.generate(
                                  categoriesModel!.categories!.length,
                                  (index) => CategoryItem(
                                      categoriesModel!.categories![index],
                                      context)),
                            ),
                          ),
                        ),
                ],
              ));
  }
}

Widget CategoryItem(Category model, ctx) => InkWell(
      //final fashionId = ModalRoute.of(ctx)!.settings.arguments.toString();
      onTap: () {
        //HomeCubit.get(ctx).getBookDetails(model.id);
        //navigateTo(ctx, BookDetailsScreen());
        //  Navigator.pushNamed(ctx, PlacesScreen.routePass, arguments: model.id);
        Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => PlacesScreen(
              catId: model.id ?? 11,
            ),
          ),
        );
      },
      child: Container(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 6,
          child: InkWell(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image(
                  image: NetworkImage(model.image!),
                  width: 75,
                  height: 150,
                ),
                Text(
                  model.name!,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.deepPurpleAccent,
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
Widget searchItem(SearchModel model, ctx) => InkWell(
      //final fashionId = ModalRoute.of(ctx)!.settings.arguments.toString();
      onTap: () {
        Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => BranchesScreen(
              bankId: model.id,
            ),
          ),
        );
      },
      child: Container(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 6,
          child: InkWell(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image(
                  image: NetworkImage(model.image),
                  width: 75,
                  height: 150,
                ),
                Text(
                  model.name,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.deepPurpleAccent,
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
