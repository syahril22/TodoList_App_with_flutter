import 'package:flutter/material.dart';
import 'package:todo_list_app/pages/signup_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/welcome.png",
                height: 194,
                width: 254,
              ),
              const SizedBox(
                height: 65,
              ),
              const Text(
                "Welcome to Daily Task",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: const Text(
                  "Start today with a bang! Make all your tasks and achievements a reality.",
                  style: TextStyle(fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 50,
                width: 330,
                child: ElevatedButton(
                  onPressed: () {
                    final route = MaterialPageRoute(
                        builder: (context) => const SignUpPage());
                    Navigator.push(context, route);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text("Get Started"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
