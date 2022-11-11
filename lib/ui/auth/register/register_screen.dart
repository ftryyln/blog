import 'package:blog/ui/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (c) => Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: const Text('Sign Up'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: c.usernameController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.green,
                          hintText: 'username',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: c.nameController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.green,
                          hintText: 'name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: c.emailController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.green,
                          hintText: 'email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: c.passwordController,
                      obscureText: c.isObscured.isFalse,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                              onPressed: () {
                                c.isObscured.toggle();
                              },
                              icon: Icon(
                                c.isObscured.isTrue
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              )),
                          focusColor: Colors.green,
                          hintText: 'password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        c.doRegister(
                            c.nameController.text,
                            c.emailController.text,
                            c.usernameController.text,
                            c.passwordController.text);
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
