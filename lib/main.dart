import 'package:first_app/features/auth/presentation/app.dart';
import 'package:first_app/features/auth/presentation/provider/login_provider.dart';
import 'package:first_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<LoginProvider>()),
        //ChangeNotifierProvider(create: (_) => sl<RegisterProvider>()),
      ],
      child: const Auth(),
    ),
  );
}
