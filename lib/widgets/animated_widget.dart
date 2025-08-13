// import 'package:flutter/material.dart';
// import '../screens/home_screen.dart';
//
// class AnimatedTransition extends StatefulWidget {
//   const AnimatedTransition({super.key});
//
//   @override
//   State<AnimatedTransition> createState() => _AnimatedTransitionState();
// }
//
// class _AnimatedTransitionState extends State<AnimatedTransition> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeIn;
//
//   final List<String> texts = ["Let's Play!", "Ho Jaay Muqabla!", "Wicket Break!"];
//   int currentIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     _fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
//
//     _controller.forward();
//
//     Future.delayed(const Duration(seconds: 2), () {
//       setState(() {
//         currentIndex = (currentIndex + 1) % texts.length;
//         _controller.reset();
//         _controller.forward();
//       });
//     });
//
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green.shade900,
//       body: Center(
//         child: FadeTransition(
//           opacity: _fadeIn,
//           child: Text(
//             texts[currentIndex],
//             style: const TextStyle(
//               fontSize: 32,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Roboto',
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
