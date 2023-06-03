import 'package:flutter/material.dart';
import 'package:zaliczenie/pages/profilePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: QuestionForm(),
    );
  }
}

enum Answer { one, two, three, four }
enum Answer1 { one1, two1 }
enum Answer2 { one2, two2, three2, four2 }
enum Answer3 { one3, two3, three3, four3 }
enum Answer4 { one4, two4, three4, four4 }
enum Answer5 { one5, two5, three5, four5 }

class QuestionForm extends StatefulWidget {
  const QuestionForm({Key? key}) : super(key: key);

  @override
  _MyQuestionFormState createState() => _MyQuestionFormState();
}

class _MyQuestionFormState extends State<QuestionForm> {
  Answer? _character = Answer.one;
  Answer1? _character1 = Answer1.one1;
  Answer2? _character2 = Answer2.one2;
  Answer3? _character3 = Answer3.one3;
  Answer4? _character4 = Answer4.one4;
  Answer5? _character5 = Answer5.one5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Form'),
        backgroundColor: Colors.pink[300],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[400],
          ),
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(30),

          child: Column(
            children: [
              Text(
                '1. Ile lat ma Twój pies?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              ListTile(
                title: const Text('Mniej niż 6 msc'),
                leading: Radio<Answer>(
                  value: Answer.one,
                  groupValue: _character,
                  onChanged: (Answer? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('6 - 12 miesięcy'),
                leading: Radio<Answer>(
                  value: Answer.two,
                  groupValue: _character,
                  onChanged: (Answer? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('12 - 24 miesięcy'),
                leading: Radio<Answer>(
                  value: Answer.three,
                  groupValue: _character,
                  onChanged: (Answer? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('starszy niż 24 miesięce'),
                leading: Radio<Answer>(
                  value: Answer.four,
                  groupValue: _character,
                  onChanged: (Answer? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              Text(
                '2. Czy pies jest agresywny?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              ListTile(
                title: const Text('Tak'),
                leading: Radio<Answer1>(
                  value: Answer1.one1,
                  groupValue: _character1,
                  onChanged: (Answer1? value) {
                    setState(() {
                      _character1 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('Nie'),
                leading: Radio<Answer1>(
                  value: Answer1.two1,
                  groupValue: _character1,
                  onChanged: (Answer1? value) {
                    setState(() {
                      _character1 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              Text(
                '3. Czy pies socjalizuje się z innymi zwierzętami?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              ListTile(
                title: const Text('Tak'),
                leading: Radio<Answer2>(
                  value: Answer2.one2,
                  groupValue: _character2,
                  onChanged: (Answer2? value) {
                    setState(() {
                      _character2 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('Nie'),
                leading: Radio<Answer2>(
                  value: Answer2.two2,
                  groupValue: _character2,
                  onChanged: (Answer2? value) {
                    setState(() {
                      _character2 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('Często'),
                leading: Radio<Answer2>(
                  value: Answer2.three2,
                  groupValue: _character2,
                  onChanged: (Answer2? value) {
                    setState(() {
                      _character2 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('Rzadko'),
                leading: Radio<Answer2>(
                  value: Answer2.four2,
                  groupValue: _character2,
                  onChanged: (Answer2? value) {
                    setState(() {
                      _character2 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              Text(
                '4. Czy pies ma kontakt z dziećmi?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              ListTile(
                title: const Text('Tak'),
                leading: Radio<Answer3>(
                  value: Answer3.one3,
                  groupValue: _character3,
                  onChanged: (Answer3? value) {
                    setState(() {
                      _character3 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('Nie'),
                leading: Radio<Answer3>(
                  value: Answer3.two3,
                  groupValue: _character3,
                  onChanged: (Answer3? value) {
                    setState(() {
                      _character3 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('Rzadko'),
                leading: Radio<Answer3>(
                  value: Answer3.three3,
                  groupValue: _character3,
                  onChanged: (Answer3? value) {
                    setState(() {
                      _character3 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('Często'),
                leading: Radio<Answer3>(
                  value: Answer3.four3,
                  groupValue: _character3,
                  onChanged: (Answer3? value) {
                    setState(() {
                      _character3 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              Text(
                '5. Czy pies kiedykolwiek brał udział w szkoleniach/treningach/indywidualnych zajęciach ze specjalistą?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              ListTile(
                title: const Text('Tak, raz.'),
                leading: Radio<Answer4>(
                  value: Answer4.one4,
                  groupValue: _character4,
                  onChanged: (Answer4? value) {
                    setState(() {
                      _character4 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('Tak, parę razy.'),
                leading: Radio<Answer4>(
                  value: Answer4.two4,
                  groupValue: _character4,
                  onChanged: (Answer4? value) {
                    setState(() {
                      _character4 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('Regularnie'),
                leading: Radio<Answer4>(
                  value: Answer4.three4,
                  groupValue: _character4,
                  onChanged: (Answer4? value) {
                    setState(() {
                      _character4 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('Nie'),
                leading: Radio<Answer4>(
                  value: Answer4.four4,
                  groupValue: _character4,
                  onChanged: (Answer4? value) {
                    setState(() {
                      _character4 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              Text(
                '6. Czy pies regularnie jada posiłki?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              ListTile(
                title: const Text('Tak, raz dziennie'),
                leading: Radio<Answer5>(
                  value: Answer5.one5,
                  groupValue: _character5,
                  onChanged: (Answer5? value) {
                    setState(() {
                      _character5 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('Tak - 2 razy dziennie - ta sama pora'),
                leading: Radio<Answer5>(
                  value: Answer5.two5,
                  groupValue: _character5,
                  onChanged: (Answer5? value) {
                    setState(() {
                      _character5 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('Tak - 3 razy dziennie - ta sama pora'),
                leading: Radio<Answer5>(
                  value: Answer5.three5,
                  groupValue: _character5,
                  onChanged: (Answer5? value) {
                    setState(() {
                      _character5 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ListTile(
                title: const Text('Nie jada regularnie'),
                leading: Radio<Answer5>(
                  value: Answer5.four5,
                  groupValue: _character5,
                  onChanged: (Answer5? value) {
                    setState(() {
                      _character5 = value;
                    });
                  },
                  activeColor: Colors.grey, // Dodany atrybut activeColor
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.grey[600],
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Formularz zatwierdzony',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Formularz zatwierdzony. Dziękujemy!',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProfilePage(
                                          breed: 'BOS',
                                          dateOfBirth: '2022-01-07',
                                          dogName: 'Buddy',
                                          ownerName: 'Krystyna',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text('Zatwierdź formularz'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[500], // Dodany atrybut backgroundColor
                ),
              ),
            ],
          ),
          )
        ),
      ),
    );
  }
}

class FormSubmitted extends StatelessWidget {
  const FormSubmitted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Submitted'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 30),
            Text(
              'Form submitted successfully!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
