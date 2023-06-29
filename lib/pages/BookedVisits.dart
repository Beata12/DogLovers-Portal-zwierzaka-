import 'package:flutter/material.dart';
import 'package:zaliczenie/pages/login.dart';
import 'ProfilePage.dart';
import 'HomePage.dart'; // Import the HomePage file

class BookedVisits extends StatefulWidget {
  final List<Appointment> bookedAppointments;

  const BookedVisits({Key? key, required this.bookedAppointments})
      : super(key: key);

  @override
  _BookedVisitsState createState() => _BookedVisitsState();
}

class _BookedVisitsState extends State<BookedVisits> {
  late List<Appointment> bookedAppointments;

  @override
  void initState() {
    bookedAppointments = widget.bookedAppointments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      padding: EdgeInsets.symmetric(horizontal: 15),
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
                            ],
                          ),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login()),
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
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: marginValue, right: marginValue),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[500],
                            ),
                            child: Center(
                              child: Text(
                                'Zarezerwowane wizyty:',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.pink[50],
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    'Wizyty nadchodzące:',
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[500],
                                  ),
                                  child: bookedAppointments.isNotEmpty
                                      ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: bookedAppointments.length,
                                    itemBuilder: (context, index) {
                                      final appointment = bookedAppointments[index];
                                      return ListTile(
                                        title: Text(
                                          'Data: ${appointment.date.day}/${appointment.date.month}/${appointment.date.year} \nGodzina: ${appointment.time} \nSpecjalista: ${appointment.specialist}',
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(Icons.delete),
                                          color: Colors.pink[50],
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Potwierdź'),
                                                  content: Text('Czy na pewno chcesz usunąć tę wizytę?'),
                                                  actions: [
                                                    TextButton(
                                                      child: Text('Anuluj'),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: Text('Usuń'),
                                                      onPressed: () {
                                                        setState(() {
                                                          bookedAppointments.removeAt(index);
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  )
                                      : Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Text(
                                      'Brak zarezerwowanych wizyt',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.pink[50],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: Text(
                                    'Historia:',
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[500],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Behawiorysta:',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Data: 10/05/2023\nGodzina: 14:00\nSpecjalista: Klaudia Nowak',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[500],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dogoterapeuta:',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Data: 15/05/2023\nGodzina: 10:00\nSpecjalista: Krzysztof Kot',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[500],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dietetyk:',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Data: 20/05/2023\nGodzina: 16:45\nSpecjalista: Aneta Kowalska',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 16),
                          FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage()),
                              );
                            },
                            child: Icon(
                              Icons.home,
                              color: Colors.grey[500],
                            ),
                            backgroundColor: Colors.pink[50],
                          ),
                        ],
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

class Appointment {
  late DateTime date;
  late String time;
  late String specialist;

  Appointment({
    required this.date,
    required this.time,
    required this.specialist,
  });

  void setDate(DateTime newDate) {
    date = newDate;
  }

  void setTime(String newTime) {
    time = newTime;
  }

  void setSpecialist(String newSpecialist) {
    specialist = newSpecialist;
  }
}
