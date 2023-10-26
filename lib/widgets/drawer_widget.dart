import 'package:flutter/material.dart';
import 'package:todo_list_app/pages/login_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              accountName: const Text(
                "Syahril Sobirin",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text(
                "syahrilsobirin@gmail.com",
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("assets/foto-profile.jpg"),
              ),
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Home")
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Logout")
                ],
              ),
              onTap: () {
                final route =
                    MaterialPageRoute(builder: (context) => const LoginPage());
                Navigator.push(context, route);
              },
            )
          ],
        ),
      ),
    );
  }
}
