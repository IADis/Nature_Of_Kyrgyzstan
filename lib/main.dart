import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_of_kyrgyzstan/auth/auth_screens/main_screen/main_screen.dart';
import 'package:nature_of_kyrgyzstan/auth/bloc/auth_bloc.dart';
import 'package:nature_of_kyrgyzstan/auth/repository/auth_repo.dart';
import 'package:nature_of_kyrgyzstan/firebase_options.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/main_mountains/bloc/mountains_bloc.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/main_mountains/repository/mountain_repo.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/main_reserves/bloc/reserves_bloc.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/reserves_parks/main_reserves/repository/reserves_repo.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/main_water_resourses/bloc/water_resourses_bloc.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/water_resources/main_water_resourses/repository/water_resourses_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepo(),
        ),
        RepositoryProvider(
          create: (context) => MountainsRepo(),
        ),
        RepositoryProvider(
          create: (context) => WaterResoursesRepo(),
        ),
        RepositoryProvider(
          create: (context) => ReservesRepo(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(authRepo: RepositoryProvider.of<AuthRepo>(context)),
          ),
          BlocProvider(
            create: (context) => MountainsBloc(
              mountainsRepo: RepositoryProvider.of<MountainsRepo>(context),
            )..add(GetMountains()),
          ),
          BlocProvider(
            create: (context) => WaterResouresBloc(
              waterResoursesRepo:
                  RepositoryProvider.of<WaterResoursesRepo>(context),
            )..add(GetWaterResourses()),
          ),
          BlocProvider(
            create: (context) => ReservesBloc(
              reservesRepo: RepositoryProvider.of<ReservesRepo>(context),
            )..add(GetReserves()),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: MainScreen(),
        ),
      ),
    );
  }
}
