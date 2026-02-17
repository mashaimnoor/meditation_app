import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/signin_bg.png'))
                    ),
                    child: Column(
                      children: [

                  /// Back Button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  const SizedBox(height: 20),
                        /// Title
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 33),

                  /// Facebook Button
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7583CA),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Image.asset('assets/images/fblogo.png', width: 12,),
                        SizedBox(width: 40,),
                        Text(
                          "CONTINUE WITH FACEBOOK",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Google Button
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Image.asset('assets/images/img_2.png', width: 24,),
                        SizedBox(width: 40),
                        Text(
                          "CONTINUE WITH GOOGLE",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                      ],
                    )
                  ),

                  const SizedBox(height: 40),

                  /// OR text
                  Text(
                    "OR LOG IN WITH EMAIL",
                    style: TextStyle(
                      color: Color.fromRGBO(161, 164, 178, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// Email Field
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email address",
                      hintStyle: TextStyle(color: Color.fromRGBO(161, 164, 178, 1)),

                      filled: true,
                      fillColor: const Color(0xFFEDEEF3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Enter valid email";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  /// Password Field
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Color.fromRGBO(161, 164, 178, 1)),
                      filled: true,
                      fillColor: const Color(0xFFEDEEF3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  /// Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(142, 151, 253, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(
                              context, '/welcome');
                        }
                      },
                      child: const Text(
                        "LOG IN",
                        style: TextStyle(
                          color: Color.fromRGBO(246, 241, 251, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Forgot Password
                  const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color.fromRGBO(63, 65, 78, 1),
                    ),
                  ),

                  const SizedBox(height: 104),

                  /// Bottom Sign Up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "ALREADY HAVE AN ACCOUNT? ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Color.fromRGBO(142, 151, 253, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
