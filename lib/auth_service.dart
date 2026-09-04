import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/login_screen.dart';

Future<void> logout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('username');
  await prefs.remove('key_stage');

  if (!context.mounted) return;

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const LoginScreen()),
  );
}
