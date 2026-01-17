import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/screens/home_screen.dart';
import '/screens/login_screen.dart';
import '/screens/register_screen.dart';

void main() => runApp(const BautistaFacebook());

class BautistaFacebook extends StatelessWidget {
  const BautistaFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Facebook Replication',
          initialRoute: '/login',
          routes: {
            '/home': (context) {
              final username =
                  ModalRoute.of(context)?.settings.arguments as String?;
              return HomeScreen(username: username);
            },
            '/login': (context) => const LogInScreen(),
            '/register': (context) => const RegisterScreen(),
          },
        );
      },
    );
  }
}
