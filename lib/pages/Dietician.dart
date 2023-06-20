import 'package:flutter/material.dart';


class Dietician extends StatefulWidget {
  const Dietician({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<Dietician> createState() => _Dietician();
}

class _Dietician extends State<Dietician>
    with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
  RestorableDateTime(DateTime(2023, 1, 19));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
  RestorableRouteFuture<DateTime?>(
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
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
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
                  color: Colors.white)),),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Dietetyk',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
                child: Container(
                  height: 115,
                  decoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Image.asset(
                                  'assets/icons/dog-food.png',
                                  height: 30,
                                ),
                              ),
                              Text('Konsultacja żywieniowa - psy', style: TextStyle(
                                fontSize: 17,)),
                              Text('100 zł', style: TextStyle(
                                fontSize: 17,)),
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
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Container(
                  height: 115,
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Image.asset(
                                  'assets/icons/dog-food.png',
                                  height: 30,
                                ),
                              ),
                              Text('Konsultacja - dolegliwości', style: TextStyle(
                                fontSize: 17,)),
                              Text('110 zł', style: TextStyle(
                                fontSize: 17,)),
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
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Container(
                  height: 115,
                  decoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Image.asset(
                                  'assets/icons/dog-food.png',
                                  height: 30,
                                ),
                              ),
                              Text('Konsultacja - niedobory', style: TextStyle(
                                fontSize: 17,)),
                              Text('120 zł', style: TextStyle(
                                fontSize: 17,)),
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
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Container(
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Image.asset(
                                  'assets/icons/dog-food.png',
                                  height: 30,
                                ),
                              ),
                              Text('BARF dla psa - wprowadzenie', style: TextStyle(
                                fontSize: 17,)),
                              Text('150 zł', style: TextStyle(
                                fontSize: 17,)),
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
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Container(
                  height: 115,
                  decoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Image.asset(
                                  'assets/icons/dog-food.png',
                                  height: 30,
                                ),
                              ),
                              Text('Pomoc w doborze karmy', style: TextStyle(
                                fontSize: 17,)),
                              Text('60 zł', style: TextStyle(
                                fontSize: 17,)),
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
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Container(
                  height: 115,
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Image.asset(
                                  'assets/icons/dog-food.png',
                                  height: 30,
                                ),
                              ),
                              Text('Szkolenia - żywienie psów', style: TextStyle(
                                fontSize: 17,)),
                              Text('100 zł', style: TextStyle(
                                fontSize: 17,)),
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
            ],),
        ),
      ),
    );
  }
}