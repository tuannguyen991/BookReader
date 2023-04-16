import 'package:demo_book_reader/di/locator.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  setupLocator();
  runApp(const MyApp());

}

// fvm flutter pub run build_runner build --delete-conflicting-outputs

// import 'package:demo_book_reader/extensions/build_context_extensions.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firebase Phone Auth Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: const LoginPage(),
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _phoneNumberController = TextEditingController();

//   bool _isLoading = false;

//   Future<void> _signInWithPhoneNumber(BuildContext context) async {
//     try {
//       // Show a loading spinner
//       setState(() {
//         _isLoading = true;
//       });

//       // Start the phone number verification process
//       verified(AuthCredential authResult) {}

//       verificationFailed(FirebaseAuthException authException) {
//         // Handle phone verification failure
//         setState(() {
//           _isLoading = false;
//         });
//         if (authException.code == 'invalid-phone-number') {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                   title: const Text('Lỗi xác thực số điện thoại'),
//                   content: const Text('Mời nhập lại số điện thoại'),
//                   actions: [
//                     TextButton(
//                       onPressed: () {
//                         context.off();
//                       },
//                       child: const Text('OK'),
//                     ),
//                   ]);
//             },
//           );
//         }
//         // ScaffoldMessenger.of(context).showSnackBar(
//         //   SnackBar(
//         //     content: Text('Error: ${authException.message}'),
//         //   ),
//         // );
//       }

//       smsSent(String verificationId, [int? forceResendingToken]) async {
//         // Navigate to the VerifyCodeScreen widget
//         final String returnedValue = await Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => VerifyCodeScreen(
//               verificationId: verificationId,
//               text: _phoneNumberController.text,
//             ),
//           ),
//         );

//         setState(() {
//           _isLoading = false;
//           _phoneNumberController.text = returnedValue;
//         });
//       }

//       autoTimeout(String verificationId) {}

//       await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: _phoneNumberController.text,
//         verificationCompleted: verified,
//         verificationFailed: verificationFailed,
//         codeSent: smsSent,
//         codeAutoRetrievalTimeout: autoTimeout,

//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error: $e'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Firebase Phone Auth Demo'),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IntlPhoneField(
//                     decoration: const InputDecoration(
//                       labelText: 'Phone Number',
//                     ),
//                     initialCountryCode: 'VN',
//                     initialValue: _phoneNumberController.text.replaceFirst('+84', '0'),
//                     onChanged: (phone) {
//                       phone.number = phone.number.replaceFirst('0', '');
//                       _phoneNumberController.text = phone.completeNumber;
//                     },
//                     disableLengthCheck: true,
//                   ),
//                   const SizedBox(height: 48),
//                   ElevatedButton(
//                     onPressed: () => _signInWithPhoneNumber(context),
//                     child: const Text('Verify Phone Number'),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

// class VerifyCodeScreen extends StatefulWidget {
//   final String verificationId;
//   final String text;

//   const VerifyCodeScreen(
//       {super.key, required this.verificationId, required this.text});

//   @override
//   // ignore: library_private_types_in_public_api
//   _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
// }

// class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
//   final _smsCodeController = TextEditingController();
//   // final _phoneController = TextEditingController(text: widget.text);

//   Future<void> _verifySMSCode(BuildContext context) async {
//     try {
//       // Create a PhoneAuthCredential with the SMS code
//       var credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationId,
//         smsCode: _smsCodeController.text,
//       );

//       // Sign the user in with the credential
//       final authResult =
//           await FirebaseAuth.instance.signInWithCredential(credential);

//       if (authResult.user != null) {
//         // ignore: use_build_context_synchronously
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Sign in successfully'),
//           ),
//         );
//       } else {
//         // ignore: use_build_context_synchronously
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Sign in failed'),
//           ),
//         );
//       }
//     } catch (e) {
//       // Handle sign in failure
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error: $e'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: BackButton(
//           onPressed: () => Navigator.pop(context, widget.text),
//         ),
//         title: const Text('Enter SMS Code'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _smsCodeController,
//               decoration: const InputDecoration(
//                 labelText: 'SMS Code',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             // ignore: prefer_const_constructors
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () => _verifySMSCode(context),
//               child: const Text('Verify SMS Code'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
