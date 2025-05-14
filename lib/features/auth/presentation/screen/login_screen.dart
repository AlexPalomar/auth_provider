// presentation/pages-screen/login_page.dart
import 'package:first_app/features/auth/presentation/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginProvider>();
    return Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: controller.setEmail,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                onChanged: controller.setPassword,
              ),
              const SizedBox(height: 16),
              if (controller.isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: () async {
                    await controller.login();
                    if (controller.resp == true) Navigator.pushReplacementNamed(context, '/home');},
                  child: const Text('Iniciar sesión'),
                ),
              if (controller.error != null) ...[
                const SizedBox(height: 16),
                Text(
                  controller.error!,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
              // if (controller.user != null) ...[
              //   const SizedBox(height: 16),
              //   Text(
              //     'Bienvenido, ${controller.user!.email}',
              //     style: const TextStyle(color: Colors.green),
              //   )
              // ]
            ],
          ),
        ));
  }
}
