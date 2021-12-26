import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_project/layout/news_app/cubit/cubit.dart';
import 'package:flutter_first_project/layout/news_app/news_layout.dart';
import 'package:flutter_first_project/layout/todo_app/todo_layout.dart';
import 'package:flutter_first_project/modules/bmi_result/bmi_result_screen.dart';
import 'package:flutter_first_project/modules/bmi/bmi_screen.dart';
import 'package:flutter_first_project/modules/counter/counter_screen.dart';
import 'package:flutter_first_project/modules/counter/cubit/cubit.dart';
import 'package:flutter_first_project/modules/login/login_screen.dart';
import 'package:flutter_first_project/modules/messenger/messenger_screen.dart';
import 'package:flutter_first_project/modules/users/users_screen.dart';
import 'package:flutter_first_project/shared/cubit/cubit.dart';
import 'package:flutter_first_project/shared/cubit/states.dart';
import 'package:flutter_first_project/shared/network/local/cache_helper.dart';
import 'package:flutter_first_project/shared/network/remote/dio_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getSport()..getScience(),),
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
          child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, stats) {},
            builder: (context, stats) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.brown,
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.brown,
                  ),
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                    titleSpacing: 20.0,
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    backwardsCompatibility: false,
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    elevation: 20.0,
                    selectedItemColor: Colors.brown,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white,
                  ),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                ),
                darkTheme: ThemeData(
                  scaffoldBackgroundColor: HexColor('181818'),
                  primarySwatch: Colors.brown,
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.brown,
                  ),
                  appBarTheme: AppBarTheme(
                    titleSpacing: 20.0,
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                    backwardsCompatibility: false,
                    backgroundColor: HexColor('181818'),
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('181818'),
                      statusBarIconBrightness: Brightness.light,
                    ),
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: HexColor('181818'),
                    elevation: 20.0,
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: Colors.brown,
                    type: BottomNavigationBarType.fixed,
                  ),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                ),
                themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
                home: NewsLayout(),
              );
            },
          ),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, stats) {},
        builder: (context, stats) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.brown,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.brown,
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                backwardsCompatibility: false,
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 20.0,
                selectedItemColor: Colors.brown,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              )),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('181818'),
              primarySwatch: Colors.brown,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.brown,
              ),
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                backwardsCompatibility: false,
                backgroundColor: HexColor('181818'),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('181818'),
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('181818'),
                elevation: 20.0,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.brown,
                type: BottomNavigationBarType.fixed,
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              )),
            ),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
