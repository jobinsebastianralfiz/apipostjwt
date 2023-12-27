import 'package:apiauthjwtdemo/screens/home_page.dart';
import 'package:apiauthjwtdemo/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = false;

  final _loginKey = GlobalKey<FormState>();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: Form(
          key: _loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter a valid username";
                  }
                },
                decoration: InputDecoration(hintText: "Username"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: isVisible,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter a valid Passord";
                  }
                },
                decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: isVisible == true
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              InkResponse(
                onTap: () async {
                  if (_loginKey.currentState!.validate()) {
                    AuthService _authService = AuthService();

                    final user = await _authService.login(
                        _usernameController.text, _passwordController.text);

                   if(user!=null){

                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(user: user,)), (route) => false);

                   }
                  }
                },
                child: Container(
                  height: 48,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text("Login"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
