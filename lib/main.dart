import 'package:flutter/material.dart';
import 'package:real_estate_auction_system/core/constants/color_constants.dart';
import 'package:real_estate_auction_system/rourte/rourte.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

//tz.initializeTimeZones();

// FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  ColorScheme colorScheme(BuildContext context) {
    if (ThemeMode.system == ThemeMode.light) {
      return lightColorScheme;
    } else {
      return darkColorScheme;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //change theme if the mobile change theme
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme(context), //ThemeMode.system,);

        //textTheme: Tạo Widget TextTheme Custom riêng
      ),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: myRourtes,
    );
  }
}
