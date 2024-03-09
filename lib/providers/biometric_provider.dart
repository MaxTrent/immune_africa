import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricProvider extends ChangeNotifier{
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _isAuthenticated = false;

  LocalAuthentication get localAuthentication => _localAuthentication;
  bool get isAuthenticated => _isAuthenticated;

  Future<bool> authenticateUser(BuildContext context) async{
    bool isBiometricSupported = await _localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;

    if (isBiometricSupported && canCheckBiometrics) {
      try {
        _isAuthenticated = await _localAuthentication.authenticate(
            localizedReason: 'Please authenticate to login',
            options: const AuthenticationOptions(
              biometricOnly: true,
              useErrorDialogs: true,
              stickyAuth: true
            ),

        );
        if (_isAuthenticated) {
          if (context.mounted) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        }
      } on PlatformException catch (e) {
        print(e);
      }
    }
    notifyListeners();
    return _isAuthenticated;
  }

  }


