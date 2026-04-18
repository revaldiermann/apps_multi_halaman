import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context);

    return Scaffold(
      body: Column(
        children: [
          // HEADER
          Container(
            height: 150,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text("Dashboard",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),

          // GRID
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                menu(context, Icons.add, "Counter", () {
                  Navigator.pushNamed(context, '/counter');
                }),
                menu(context, Icons.person, "Profil Saya", () {
                  Navigator.pushNamed(
                    context,
                    '/profile',
                    arguments: auth.username,
                  );
                }),
                menu(context, Icons.settings, "setting", () {
                  Navigator.pushNamed(context, '/setting');
                }),
                menu(context, Icons.logout, "Logout", () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return AlertDialog(
                        title: const Text("Konfirmasi"),
                        content: const Text("Yakin ingin keluar?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext); // tutup dialog saja
                            },
                            child: const Text("Batal"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(dialogContext); // tutup dialog

                              // pindah ke login + hapus semua route
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                '/login',
                                (route) => false,
                              );
                            },
                            child: const Text("Keluar"),
                          ),
                        ],
                      );
                    },
                  );
                }),
              ],
            ),
          ),

          // STACK BANNER

          Stack(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color.fromARGB(255, 30, 52, 148), Color.fromARGB(255, 45, 61, 187)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selamat Datang 👋",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      auth.username ?? "username",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget menu(context, icon, label, onTap) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            Text(label),
          ],
        ),
      ),
    );
  }
}
