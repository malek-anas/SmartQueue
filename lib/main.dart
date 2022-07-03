import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartqueue/SplashScreen/SplashScreen.dart';
import 'package:smartqueue/cubit/FavoritesCubit/favorites_cubit.dart';
import 'package:smartqueue/cubit/current_reservation-cubit/posts_cubit.dart';
import 'package:smartqueue/modules/current_reservation_screen.dart';
import 'package:smartqueue/noti.dart';
import 'bloc_observer.dart';
import 'cubit/Auth-cubit/cubit.dart';
import 'cubit/Categories-cubit/categories_cubit.dart';
import 'cubit/NotificationCuit/notification_cubit.dart';
import 'cubit/Places-cubit/places_cubit.dart';
import 'cubit/ProfileCubit/profile_cubit.dart';
import 'cubit/Reservation/reservation_cubit.dart';
import 'cubit/branch-cubit/branches_cubit.dart';
import 'cubit/getReservation/get_reservation_cubit.dart';
import 'database/CacheHelper.dart';
import 'database/DioHelper.dart';
import 'modules/notificationsScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //runApp(MyApp());

  DioHelper.init();
  await CacheHelper.int();
  print(CacheHelper.getData(key: 'token'));
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    NotificationService.init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider<BranchesCubit>(
          create: (context) => BranchesCubit(),
        ),
        BlocProvider<PlacesCubit>(
          create: (context) => PlacesCubit(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider<ReservationCubit>(
          create: (context) => ReservationCubit(),
        ),
        BlocProvider<FavoritesCubit>(
          create: (context) => FavoritesCubit(),
        ),
        BlocProvider(
          create: (context) => Current_reservation()..posts,
          child: CurrentReservationScreen(),
        ),
        BlocProvider(
          create: (context) => GetReservationCubit(),
          child: CurrentReservationScreen(),
        ),
        BlocProvider(
          create: (context) => NotificationCubit(),
          child: notificationsScreen(),
        ),
        BlocProvider<CategoriesCubit>(
          create: (context) => CategoriesCubit()..getCategoriesData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        // routes: {
        //   BanksDetailsScreen.routePass: (context) => PlacesScreen(),
        // },
      ),
    );
  }
}
