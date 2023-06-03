import 'package:flutter/material.dart';

class WhyMe extends StatelessWidget {
  const WhyMe({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'Dlaczego ja?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Scrollbar(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Kim jestem?",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Jestem behawiorystą i certyfikowanym instruktorem pozytywnego szkolenia psów metodą klikerową. Cały czas podnoszę swoje kwalifikacje, biorąc udział w różnego rodzaju kursach, warsztatach czy webinarach.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Dlaczego psy?",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Psy były w moim życiu od kiedy pamiętam. Prawdziwe, szczere i bezgranicznie oddane. Mój tata był opiekunem psa w służbach mundurowych, a w naszym domu przez kilkanaście lat towarzyszył mi Dolar, mieszaniec jamnika i pinczera miniaturowego. Od 2020 roku jest ze mną Jager. Średniej wielkości kundel oraz mój serdeczny przyjaciel. To właśnie on tak bardzo zaciekawił mnie swoim światem, że postanowiłem zostać trenerem i behawiorystą.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
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