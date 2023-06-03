import 'package:flutter/material.dart';
import 'WhyMe.dart';

class AllSpecialists extends StatefulWidget {
  const AllSpecialists({Key? key, this.restorationId});

  final String? restorationId;

  @override
  State<AllSpecialists> createState() => _AllSpecialistsState();
}

class _AllSpecialistsState extends State<AllSpecialists> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
  RestorableDateTime(DateTime(2023, 1, 19));
  late final RestorableRouteFuture<DateTime?>
  _restorableDatePickerRouteFuture = RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
      BuildContext context,
      Object? arguments,
      ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(
              arguments! as int),
          firstDate: DateTime(2022),
          lastDate: DateTime(2032),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Wybrałaś: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}, Do zobaczenia!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'Wszyscy specjaliści',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: Container(
                    height: 113,
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 7,
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Image.asset(
                                      'assets/icons/1woman.png',
                                      height: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                            const WhyMe(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Klaudia Nowak',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Behawiorysta',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow[500],
                                  ),
                                  Text(
                                    '4.9',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8.0,
                                    ),
                                    child: Image.asset(
                                      'assets/icons/booking.png',
                                      height: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8.0,
                                    ),
                                    child: OutlinedButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                      ),
                                      onPressed: () {
                                        _restorableDatePickerRouteFuture
                                            .present();
                                      },
                                      child: const Text(
                                        'Zarezerwuj wizytę',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: Container(
                    height: 113,
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row (
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Image.asset(
                                        'assets/icons/Yman.png',
                                        height: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const WhyMe()),
                                          );
                                        },
                                        child: Center(
                                          child: Text('Kacper Kot',
                                            style: TextStyle(fontSize: 16, color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text('Dogoterapeuta', style: TextStyle(
                                  fontSize: 17,)),
                                Row (
                                  children: [
                                    Icon(Icons.star,
                                      color: Colors.yellow[500],),
                                    Text('4.6', style: TextStyle(
                                      fontSize: 16,)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 0, top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row (
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Image.asset(
                                        'assets/icons/booking.png',
                                        height: 20,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Center(
                                        child: OutlinedButton(
                                          style: ButtonStyle(
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                          ),
                                          onPressed: () {
                                            _restorableDatePickerRouteFuture.present();
                                          },
                                          child: const Text('Zarezerwuj wizytę',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18)),
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
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: Container(
                    height: 113,
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row (
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Image.asset(
                                        'assets/icons/Yman.png',
                                        height: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const WhyMe()),
                                          );
                                        },
                                        child: Center(
                                          child: Text('Jacek Kamiński',
                                            style: TextStyle(fontSize: 16, color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text('Behawiorysta', style: TextStyle(
                                  fontSize: 17,)),
                                Row (
                                  children: [
                                    Icon(Icons.star,
                                      color: Colors.yellow[500],),
                                    Text('4.2', style: TextStyle(
                                      fontSize: 16,)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 0, top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row (
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Image.asset(
                                        'assets/icons/booking.png',
                                        height: 20,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Center(
                                        child: OutlinedButton(
                                          style: ButtonStyle(
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                          ),
                                          onPressed: () {
                                            _restorableDatePickerRouteFuture.present();
                                          },
                                          child: const Text('Zarezerwuj wizytę',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18)),
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
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: Container(
                    height: 113,
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row (
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Image.asset(
                                        'assets/icons/Yman.png',
                                        height: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const WhyMe()),
                                          );
                                        },
                                        child: Center(
                                          child: Text('Kacper Fans',
                                            style: TextStyle(fontSize: 16, color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text('Dogoterapeuta', style: TextStyle(
                                  fontSize: 17,)),
                                Row (
                                  children: [
                                    Icon(Icons.star,
                                      color: Colors.yellow[500],),
                                    Text('4.6', style: TextStyle(
                                      fontSize: 16,)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 0, top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row (
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Image.asset(
                                        'assets/icons/booking.png',
                                        height: 20,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Center(
                                        child: OutlinedButton(
                                          style: ButtonStyle(
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                          ),
                                          onPressed: () {
                                            _restorableDatePickerRouteFuture.present();
                                          },
                                          child: const Text('Zarezerwuj wizytę',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18)),
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
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: Container(
                    height: 113,
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row (
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Image.asset(
                                        'assets/icons/woman.png',
                                        height: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const WhyMe()),
                                          );
                                        },
                                        child: Center(
                                          child: Text('Aneta Kowalska',
                                            style: TextStyle(fontSize: 17, color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),                                    ],
                                ),
                                Text('Dietetyk', style: TextStyle(
                                  fontSize: 17,)),
                                Row (
                                  children: [
                                    Icon(Icons.star,
                                      color: Colors.yellow[500],),
                                    Text('4.9', style: TextStyle(
                                      fontSize: 16,)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 0, top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row (
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Image.asset(
                                        'assets/icons/booking.png',
                                        height: 20,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 8.0), // Dodany górny margines
                                          child: OutlinedButton(
                                            style: ButtonStyle(
                                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                            ),
                                            onPressed: () {
                                              _restorableDatePickerRouteFuture.present();
                                            },
                                            child: const Text(
                                              'Zarezerwuj wizytę',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
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
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: Container(
                    height: 113,
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row (
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Image.asset(
                                        'assets/icons/Bman.png',
                                        height: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const WhyMe()),
                                          );
                                        },
                                        child: Center(
                                          child: Text('Jan Szymański',
                                            style: TextStyle(fontSize: 16, color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text('Dogoterapeuta', style: TextStyle(
                                  fontSize: 17,)),
                                Row (
                                  children: [
                                    Icon(Icons.star,
                                      color: Colors.yellow[500],),
                                    Text('4.7', style: TextStyle(
                                      fontSize: 16,)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 0, top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row (
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Image.asset(
                                        'assets/icons/booking.png',
                                        height: 20,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Center(
                                        child: OutlinedButton(
                                          style: ButtonStyle(
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                          ),
                                          onPressed: () {
                                            _restorableDatePickerRouteFuture.present();
                                          },
                                          child: const Text('Zarezerwuj wizytę',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18)),
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
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: Container(
                    height: 113,
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 7,
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Image.asset(
                                      'assets/icons/beauty.png',
                                      height: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                            const WhyMe(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Amanda Kamień',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Dietetyk',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow[500],
                                  ),
                                  Text(
                                    '4.8',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8.0,
                                    ),
                                    child: Image.asset(
                                      'assets/icons/booking.png',
                                      height: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8.0,
                                    ),
                                    child: OutlinedButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                      ),
                                      onPressed: () {
                                        _restorableDatePickerRouteFuture
                                            .present();
                                      },
                                      child: const Text(
                                        'Zarezerwuj wizytę',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: Container(
                    height: 113,
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 7,
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Image.asset(
                                      'assets/icons/man.png',
                                      height: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                            const WhyMe(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Krzysztof Kot',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Behawiorysta',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow[500],
                                  ),
                                  Text(
                                    '4.9',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8.0,
                                    ),
                                    child: Image.asset(
                                      'assets/icons/booking.png',
                                      height: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8.0,
                                    ),
                                    child: OutlinedButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                      ),
                                      onPressed: () {
                                        _restorableDatePickerRouteFuture
                                            .present();
                                      },
                                      child: const Text(
                                        'Zarezerwuj wizytę',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
      ),
    );
  }
}



