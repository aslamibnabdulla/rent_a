import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as provider;
import 'package:rent_a/screens/apartments_screen.dart';
import 'package:rent_a/screens/car/car_screen.dart';
import 'package:rent_a/colors/colors.dart';
import 'package:rent_a/screens/equipments_screen.dart';
import 'package:rent_a/screens/login_screen.dart';
import 'package:rent_a/screens/splash_screen.dart';
import 'package:rent_a/widgets/navigation_bar.dart';
import 'package:rent_a/widgets/services/auth.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    // var isAutoLogin = ref.watch(authProvider);
    return provider.ChangeNotifierProvider(
      create: (context) => Auth(),
      child: provider.Consumer<Auth>(
        builder: (context, auth, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: auth.isAuth
                ? const HomePage()
                : FutureBuilder(
                    future: auth.autoLogIn(),
                    builder: ((context, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? const SplashScreen()
                          : const LoginScreen();
                    }),

                    //   // HomePage(),
                  ),
          );
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  var currentPageIndex = 0;
  void updateUI(int newIndex) {
    currentPageIndex = newIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarWidget(
        currentPageIndex: currentPageIndex,
        updateUI: updateUI,
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          CarScreen(),
          const EquipmentsScreen(),
          const ApartmentsScreen(),
        ],
      ),
    );
  }
}

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colours.scaffColor,
  useMaterial3: true, // Enable Material 3 theming
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.teal, // Set primary color
    primary: Colors.teal, // Alias for primary color
    secondary: Colors.blue, // Set secondary color
  ),

  // Other theme properties (optional)
);
