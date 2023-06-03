import 'package:flutter/material.dart';
import 'package:zaliczenie/pages/QuestionForm.dart';
import 'package:zaliczenie/pages/login.dart';

import 'AllSpecialists.dart';
import 'Behaviourist.dart';
import 'Dietician.dart';
import 'DogTherapist.dart';
import 'WhyMe.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("DOGLOVERS" ,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.pink[300],
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },

                        child: Center(
                          child: Image.asset(
                            'assets/icons/logout.png',
                            height: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        'assets/icons/pawprint.png',
                        height: 100,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Wypełnij formularz, a my powiemy czego potrzebuje Twój pupil!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[700],
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const QuestionForm()),
                                  );
                                },
                                child: Center(
                                  child: Text("Wypełnij formularz",
                                    style: TextStyle(color: Colors.white, fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ),


              SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(12)),
                  child: Text("Zapoznaj sie z naszą ofertą:",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),


              SizedBox(height: 25),

              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[500],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row (
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Image.asset(
                                    'assets/icons/trainer.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Behaviourist()),
                                      );
                                    },
                                    child: Center(
                                      child: Text('Behawiorysta',
                                        style: TextStyle(fontSize: 19, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row (
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Behaviourist()),
                                      );
                                    },
                                    child: Center(
                                      child: Text('wiecej',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.pink[50],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row (
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Image.asset(
                                    'assets/icons/dog-training.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const DogTherapist()),
                                      );
                                    },
                                    child: Center(
                                      child: Text('Dogoterapeuta',
                                        style: TextStyle(fontSize: 19, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row (
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const DogTherapist()),
                                      );
                                    },
                                    child: Center(
                                      child: Text('wiecej',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[500],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row (
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Image.asset(
                                    'assets/icons/dog-food.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Dietician()),
                                      );
                                    },
                                    child: Center(
                                      child: Text('Dietetyk',
                                        style: TextStyle(fontSize: 19, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row (
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Dietician()),
                                      );
                                    },
                                    child: Center(
                                      child: Text('wiecej',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),



              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nasi specjaliści',
                      style:
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AllSpecialists()),
                        );
                      },
                      child: Text('Wszyscy specjaliści', style: TextStyle(
                        color: Colors.pink[500], fontSize: 16,
                      )),
                    )

                  ],
                ),
              ),

              SizedBox(height: 5),

              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, bottom: 25),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/1woman.png',
                              height: 60,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TextButton(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                ),

                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const WhyMe()),
                                  );
                                },
                                child: Center(
                                  child: Text('Klaudia Nowak',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  ),


                                ),
                              ),

                            ),

                            Text('Behawiorysta'),
                          ],

                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 25),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey[500],
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/Yman.png',
                              height: 60,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TextButton(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const WhyMe()),
                                  );
                                },
                                child: Center(
                                  child: Text('Kacper Kamiński',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),

                            Text('Dogoterapeuta'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 25, bottom: 25),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/woman.png',
                              height: 60,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TextButton(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const WhyMe()),
                                  );
                                },
                                child: Center(
                                  child: Text('Aneta Kowalska',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),


                            Text('Dietetyk zwierzęcy'),
                          ],

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ),

    );
  }
}
