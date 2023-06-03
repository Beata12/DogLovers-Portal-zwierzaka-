import 'package:flutter/material.dart';
import 'package:zaliczenie/pages/profileForm.dart';

void main() {
  runApp(Register());
}

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Register Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrerForm(),
    );
  }
}

class RegistrerForm extends StatefulWidget {
  @override
  _RegistrerFormState createState() => _RegistrerFormState();
}

class _RegistrerFormState extends State<RegistrerForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void register() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Example password verification logic
    if (email.length < 4) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Błąd logowania'),
            content: Text('Wprowadź login, który zawiera co najmniej 4 znaki.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&\*])').hasMatch(password)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Błąd logowania'),
            content: Text('Sprawdź poprawność hasła. Musi zawierać małe i duże litery, liczby oraz znak specjalny.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileForm()),
      );

      setState(() {
        _emailController.clear();
        _passwordController.clear();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Container(
                  height: 150,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'DOGLOVERS',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink[300],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Portal\nzwierzaka',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Login: ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[400],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'login123',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Hasło: ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[400],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: '**********',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey[600],
                              ),
                              onPressed: togglePasswordVisibility,
                            ),
                          ),
                          obscureText: !_isPasswordVisible,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextButton(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Zarejestruj',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.pink[300],
                            minimumSize: Size.fromHeight(40),
                          ),
                          onPressed: register,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10), // Dodany margines na dole
            ],
          ),
        ),
      ),
    );
  }
}