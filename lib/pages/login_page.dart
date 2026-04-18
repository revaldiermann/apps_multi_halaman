import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool isValid = false;

  void validate() {
    setState(() {
      isValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  @override
Widget build(BuildContext context) {
  final auth = Provider.of<AuthController>(context);

  return Scaffold(
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F2027), Color(0xFF2C5364)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              onChanged: validate,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Username
                  TextFormField(
                    controller: userCtrl,
                    decoration: InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (v) =>
                        v == null || v.isEmpty ? "Username wajib" : null,
                  ),

                  const SizedBox(height: 15),

                  // Password
                  TextFormField(
                    controller: passCtrl,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (v) =>
                        v != null && v.length >= 6
                            ? null
                            : "Min 6 karakter",
                  ),

                  const SizedBox(height: 25),

                  // BUTTON HOVER
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: StatefulBuilder(
                      builder: (context, setHover) {
                        bool isHover = false;

                        return MouseRegion(
                          onEnter: (_) => setHover(() => isHover = true),
                          onExit: (_) => setHover(() => isHover = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isValid
                                  ? (isHover
                                      ? Colors.blue.shade700
                                      : Colors.blue)
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: isValid
                                    ? () {
                                        bool success = auth.login(
                                            userCtrl.text, passCtrl.text);

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(success
                                                ? "Login Berhasil"
                                                : "Periksa kembali input"),
                                          ),
                                        );

                                        if (success) {
                                          Navigator.pushReplacementNamed(
                                              context, '/dashboard');
                                        }
                                      }
                                    : null,
                                child: const Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
}
