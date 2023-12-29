import 'package:chat_app_ui/chat_view.dart';
import 'package:chat_app_ui/register_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/chat_logo.png',
                    height: 200,
                  ),
                  const Text(
                    'Login to your account',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    // maxLines: 4,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email must not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: const Text('Email'),
                      // hintText: 'Enter your email here',
                      // contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(Icons.email_rounded,
                          color: Color(0xff4622fe)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff4622fe)),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff4622fe)),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isShow,
                    validator: (value) {
                      if (value!.length < 8) {
                        return 'password must be at least 8 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      // hintText: 'Enter your email here',
                      // contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon:
                          const Icon(Icons.lock, color: Color(0xff4622fe)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isShow = !isShow;
                            });
                          },
                          icon: Icon(
                              (isShow)
                                  ? Icons.remove_red_eye_rounded
                                  : Icons.visibility_off_rounded,
                              color: const Color(0xff4622fe))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff4622fe)),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff4622fe)),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff4622fe),
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              foregroundColor: Colors.white),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => const ChatView(),
                              ));
                            }
                          },
                          child: const Text('LOGIN'))),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('I haven\'t an account'),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const RegisterView(),
                            ));
                          },
                          child: const Text(
                            'Create one!',
                            style: TextStyle(
                              color: Color(0xff4622fe),
                            ),
                          ))
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
