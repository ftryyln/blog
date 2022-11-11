import 'package:blog/ui/auth/login/login_controller.dart';
import 'package:blog/ui/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (c) => Scaffold(
              backgroundColor: Colors.black,
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Blog Orang Gabut",
                        style: GoogleFonts.dancingScript(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold))),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: c.usernameController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.green,
                          hintText: 'username',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Username Harus Diisi");
                        }
                        // reg expression for email validation
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(() => TextFormField(
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
                                        ? Icons.visibility_off_rounded
                                        : Icons.visibility_rounded,
                                    color: Colors.grey,
                                  )),
                              focusColor: Colors.green,
                              hintText: 'password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        c.doLogin(c.usernameController.text,
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
                          'Login',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => const RegisterPage()),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 16, color: Colors.blueAccent),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
