import 'package:fakestore/model/colors.dart';
import 'package:fakestore/model/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.transparent,
          cursorColor: EColors.green,
          selectionHandleColor: EColors.green,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0,
          actionsIconTheme: IconThemeData(
            color: EColors.green,
          ),
          iconTheme: IconThemeData(
            color: EColors.green,
          ),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Montserrat',
            color: EColors.green,
            fontSize: 16,
            fontStyle: FontStyle.normal,
          ),
          headline1: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 30,
            color: EColors.green,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            color: EColors.green,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            color: EColors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        hintColor: EColors.green,
        shadowColor: EColors.green,
        focusColor: EColors.green,
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: EColors.green,
          labelStyle: TextStyle(
            color: EColors.green,
          ),
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          iconColor: EColors.green,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: EColors.green,
            shadowColor: EColors.green,
            side: const BorderSide(
              color: EColors.green,
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor:EColors.green,
        ),
        iconTheme: const IconThemeData(
          color: EColors.green,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: EColors.green,
        ),
      ),
      themeMode: ThemeMode.light,
      initialRoute: '/',
      getPages: routes,
    );
  }
}
