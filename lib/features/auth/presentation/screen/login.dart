// presentation/pages-screen/login_page.dart
import 'package:first_app/features/auth/presentation/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class LoginPage extends StatelessWidget {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailCtrl, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passCtrl, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            provider.isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      provider.login(emailCtrl.text, passCtrl.text);
                    },
                    child: Text("Ingresar"),
                  ),
            if (provider.error != null) Text(provider.error!, style: TextStyle(color: Colors.red)),
            if (provider.user != null) Text("Bienvenido ${provider.user!.email}"),
          ],
        ),
      ),
    );
  }
}

