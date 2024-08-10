// import 'package:flutter/material.dart';
// import 'package:tic_tac_toe/HomePage.dart';
//
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _navigateToHome();
//   }
//
//   _navigateToHome() async {
//     await Future.delayed(const Duration(milliseconds: 3000), () {});
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const Homepage()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Image.asset('assets/tic.png'), //  splash screen image
//       ),
//     );
//   }
// }