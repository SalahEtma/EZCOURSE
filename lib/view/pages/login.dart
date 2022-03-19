// import 'package:course_app/view/components/custom_formfield.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Login extends StatefulWidget {
//   Login({Key? key}) : super(key: key);

//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Login',
//                   style: TextStyle(
//                       fontSize: 50, color: Colors.blueAccent),
//                 ),
//                 SizedBox(
//                   height: Get.height / 10,
//                 ),
//                 CustomFormField(
//                   hint: 'Email Address',
//                   icon: Icon(Icons.email),
//                 ),
//                 CustomFormField(
//                   hint: 'Password',
//                   icon: Icon(Icons.lock),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                         onPressed: () {},
//                         child: Text('Forgot Password?')),
//                   ],
//                 ),
//                 ElevatedButton(
//                     onPressed: () {}, child: Text('Login')),
//                 SizedBox(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('Don\'t have an account? '),
//                     TextButton(
//                         onPressed: () {},
//                         child: Text('Register here'))
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
