import 'package:flutter/material.dart';
import 'package:todo_list_app/pages/login_page.dart';
import 'package:todo_list_app/widgets/input_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 800;
    final EdgeInsets padding = isWeb
        ? const EdgeInsets.only(top: 50)
        : const EdgeInsets.only(top: 100);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome to Onboard! ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 25),
                  const SizedBox(
                    height: 40,
                    width: 203,
                    child: Text(
                      "Let’s help to meet up your tasks.",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(height: 63),
                  const CustomTextField(hintText: "Enter your full name"),
                  const SizedBox(height: 20),
                  const CustomTextField(hintText: "Enter your email"),
                  const SizedBox(height: 20),
                  const CustomTextField(hintText: "Enter password"),
                  const SizedBox(height: 20),
                  const CustomTextField(hintText: "Comfirm password"),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 50,
                    width: 330,
                    child: ElevatedButton(
                      onPressed: () {
                        final route = MaterialPageRoute(
                            builder: (context) => const LoginPage());
                        Navigator.push(context, route);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      child: const Text("Register"),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account ? "),
                      TextButton(
                        onPressed: () {
                          final route = MaterialPageRoute(
                              builder: (context) => const LoginPage());
                          Navigator.push(context, route);
                        },
                        child: Text(
                          "sign in",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
