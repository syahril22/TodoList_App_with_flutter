import 'package:flutter/material.dart';
import 'package:todo_list_app/pages/home_page.dart';
import 'package:todo_list_app/pages/signup_page.dart';
import 'package:todo_list_app/widgets/input_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 800;
    final EdgeInsets padding = isWeb
        ? const EdgeInsets.only(top: 50)
        : const EdgeInsets.only(top: 100);
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 3),
        child: SafeArea(
          child: Padding(
            padding: padding,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome back",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 48),
                    Image.asset(
                      "assets/login.png",
                      width: 184.44,
                      height: 138,
                    ),
                    const SizedBox(height: 50),
                    const CustomTextField(hintText: "Enter your email"),
                    const SizedBox(height: 20),
                    const CustomTextField(hintText: "Enter your password"),
                    const SizedBox(height: 20),
                    Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: 330,
                      child: ElevatedButton(
                        onPressed: () {
                          final route = MaterialPageRoute(
                              builder: (context) => const HomePage());
                          Navigator.push(context, route);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        child: const Text("Login"),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don’t have an account ? "),
                        TextButton(
                          onPressed: () {
                            final route = MaterialPageRoute(
                                builder: (context) => SignUpPage());
                            Navigator.push(context, route);
                          },
                          child: Text(
                            "sign up",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
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
      ),
    );
  }
}
