import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a/widgets/services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  var obscureText = true;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  var _isLoading = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final test = Provider.of<Auth>(context);

    return Scaffold(
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Log In'),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Username',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: obscureText,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscureText = !obscureText;
                      setState(() {});
                    },
                    icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off),
                  ),
                  icon: const Icon(Icons.lock),
                  hintText: 'Password',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  } else {
                    if (!regex.hasMatch(value)) {
                      return 'Enter valid password';
                    } else {
                      return null;
                    }
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  var desc = 'Processing data';
                  if (_key.currentState!.validate()) {
                    _isLoading = true;
                    setState(() {});

                    String? result = await test.logIn(
                        _emailController.text, _passwordController.text);

                    if (result == null) {
                      _isLoading = false;
                      desc = 'something went wrong';
                      setState(() {});
                    }

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(desc)));
                  }
                },
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeCap: StrokeCap.butt,
                          strokeWidth: 3,
                        ))
                    : const Text('Log In'),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     test.autoLogIn();

              //     // Navigator.push(
              //     //     context,
              //     //     MaterialPageRoute(
              //     //         builder: (context) => const HomePage()));
              //     // if (_key.currentState!.validate()) {
              //     //   ScaffoldMessenger.of(context).showSnackBar(
              //     //       const SnackBar(content: Text('Processing Data')));
              //     // }
              //     // print(_key.currentState!.validate());
              //   },
              //   child: const Text('autolog In'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
