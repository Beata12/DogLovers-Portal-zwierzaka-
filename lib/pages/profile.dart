import 'package:flutter/material.dart';
import 'package:zaliczenie/pages/login.dart';


class Profile extends StatelessWidget {
  final String ownerName;
  final String dogName;
  final String dateOfBirth;
  final String breed;

  const Profile({
    Key? key,
    required this.ownerName,
    required this.dogName,
    required this.dateOfBirth,
    required this.breed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    // Obliczanie wieku psa na podstawie daty urodzenia
    final DateTime dogBirthDate = DateTime.parse(dateOfBirth);
    final DateTime currentDate = DateTime.now();
    final Duration ageDuration = currentDate.difference(dogBirthDate);
    final int dogAgeInMonths = (ageDuration.inDays / 30).floor();

    String formatDogAge(int dogAgeInMonths) {
      if (dogAgeInMonths < 1) {
        final int days = ageDuration.inDays;
        return '$days dni';
      } else if (dogAgeInMonths < 12) {
        return '$dogAgeInMonths msc';
      } else {
        final int years = dogAgeInMonths ~/ 12;
        final int months = dogAgeInMonths % 12;
        if (months == 0) {
          return '$years rok';
        } else {
          return '$years rok $months msc';
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8, top: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double maxWidth = constraints.maxWidth;
                final double marginValue = maxWidth * 0.1;

                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: marginValue),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "DOGLOVERS",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink[300],
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                ownerName,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
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
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(
                        left: marginValue,
                        right: marginValue,
                      ),
                      child: Container(
                        width: 230,
                        height: 230,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pink[300],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/img.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(
                        left: marginValue,
                        right: marginValue,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[500],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/puppy.png',
                                  height: 40,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  'Imie psa:',
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  dogName,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(
                        left: marginValue,
                        right: marginValue,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.pink[50],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/puppy.png',
                                  height: 40,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  'Wiek psa:',
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  formatDogAge(dogAgeInMonths),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(
                        left: marginValue,
                        right: marginValue,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[500],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/puppy.png',
                                  height: 40,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  'Urodziny:',
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  dateOfBirth,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(
                        left: marginValue,
                        right: marginValue,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.pink[50],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/puppy.png',
                                  height: 40,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  'Rasa psa',
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  breed,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
