import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = '';
  bool changed = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changed = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/login.png', fit: BoxFit.cover),
            SizedBox(height: 20),
            Text('Welcome $name', style: TextStyle(fontSize: 22)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter username', labelText: 'Username'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'username cannot be empty';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'enter password', labelText: 'password'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'password cannot be empty';
                          } else if (value.length < 6) {
                            return 'password too short';
                          } else {
                            return null;
                          }
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () => moveToHome(),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: Alignment.center,
                  child: changed
                      ? Icon(Icons.done, color: Colors.white)
                      : Text('Login',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                  height: 50,
                  width: changed ? 50 : 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(changed ? 23 : 8),
                      color: Colors.deepPurple)),
            )
            // ElevatedButton(
            //     style: TextButton.styleFrom(minimumSize: Size(100, 60)),
            //     child: Text('LOGIN'),
            //     onPressed: (() {
            //       Navigator.pushNamed(context, '/home');
            //     }))
          ],
        ),
      ),
    );
  }
}
