// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:local_auth/error_codes.dart' as local_auth_error;
//
// class Biometric extends StatefulWidget {
//   const Biometric({super.key});
//
//   @override
//   State<Biometric> createState() => _BiometricState();
// }
//
// class _BiometricState extends State<Biometric> {
//   final _localAuth = LocalAuthentication();
//   bool _isUserAuthorized = false;
//
//   Future<bool> authenticateUser() async {
//     bool isAuthorized = false;
//     try{
//       var canCheck = await _localAuth.canCheckBiometrics;
//       return canCheck;
//     }catch(e){
//       return false;
//     }
//
//   }
//   Future<List<dynamic>> getAvailableBiometrics() async {
//     try {
//       var availableBiometrics = await _localAuth.getAvailableBiometrics();
//       return availableBiometrics;
//     } catch (e) {
//       // Handle error
//       return [];
//     }
//   }
//
//   Future<bool> authenticateWithBiometrics(String reason) async {
//     try {
//       var authentication = await _localAuth.authenticate(
//         localizedReason: reason,
//         useBiometrics: true,
//         stickyAuth: true,
//       );
//       return authentication.authenticated;
//     } catch (e) {
//       // Handle error
//       return false;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
