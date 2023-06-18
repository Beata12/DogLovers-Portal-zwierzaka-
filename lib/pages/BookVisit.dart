import 'package:flutter/material.dart';
import 'BookedVisits.dart';

class BookVisit extends StatefulWidget {
  const BookVisit({Key? key, this.restorationId}) : super(key: key);

  final String? restorationId;

  @override
  State<BookVisit> createState() => _BookVisitState();
}

class _BookVisitState extends State<BookVisit> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
  RestorableDateTime(DateTime.now()); // Ustawienie dzisiejszej daty
  String? _selectedTime;
  String? _selectedSpecialist;
  bool _isAppointmentBooked = false;
  List<Appointment> _bookedAppointments = []; // Track booked appointments

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
      BuildContext context, Object? arguments) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime.now(),
          lastDate: DateTime(2032),
        );
      },
    );
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      // Sprawdź czy wybrana data nie jest sobotą ani niedzielą
      if (newSelectedDate.weekday == DateTime.saturday ||
          newSelectedDate.weekday == DateTime.sunday) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Błąd'),
              content:
              const Text('Niestety, w soboty i niedzielę nie przyjmujemy. Wybierz inną datę, od poniedziałku do piątku.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        return; // Zwróć wartość bez aktualizacji
      }

      setState(() {
        _selectedDate.value = newSelectedDate;
      });
    }
  }

  void _selectTime(String? time) {
    if (time != null && DateTime.now().isBefore(_selectedDate.value)) {
      setState(() {
        _selectedTime = time;
      });
    }
  }

  void _selectSpecialist(String? specialist) {
    setState(() {
      _selectedSpecialist = specialist;
    });
  }

  void _bookAppointment() {
    if (_selectedTime != null &&
        _selectedSpecialist != null &&
        _selectedDate.value.weekday != DateTime.saturday &&
        _selectedDate.value.weekday != DateTime.sunday) {
      // Check for conflicting appointments
      bool hasConflict = _bookedAppointments.any((appointment) =>
      appointment.date == _selectedDate.value &&
          appointment.time == _selectedTime &&
          appointment.specialist == _selectedSpecialist);

      if (hasConflict) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Błąd'),
              content: const Text('Wybrany termin jest już zajęty.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        return; // Zwróć wartość bez aktualizacji
      }

      setState(() {
        _isAppointmentBooked = true;
        _bookedAppointments.add(
          Appointment(
            date: _selectedDate.value,
            time: _selectedTime!,
            specialist: _selectedSpecialist!,
          ),
        );
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookedVisits(
            bookedAppointments: _bookedAppointments,
          ),
        ),
      );
    }
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Usunięcie strzałki do powrotu
        backgroundColor: Colors.pink[500], // Ustawienie szarego tła dla AppBar
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Zarezerwuj wizytę', // Tekst "Zarezerwowane wizyty"
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Kolor tekstu
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),

          ],
        ),
      ),

      body: Container(
        color: Colors.grey[400], // Ustawienie szarego tła
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Wybrana data: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.pink[200]! // Ustawienie różowego koloru przycisku
                  ),
                ),
                onPressed: () {
                  _restorableDatePickerRouteFuture.present();
                },
                child: const Text('Zmień datę'),
              ),
              DropdownButton<String>(
                value: _selectedTime,
                hint: const Text('Wybierz godzinę'),
                onChanged: _isAppointmentBooked ? null : _selectTime,
                items: <String>[
                  '10:00',
                  '12:00',
                  '14:00',
                  '16:00',
                  '18:00',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              DropdownButton<String>(
                value: _selectedSpecialist,
                hint: const Text('Wybierz specjalistę'),
                onChanged: _isAppointmentBooked ? null : _selectSpecialist,
                items: <String>[
                  'Klaudia Nowak',
                  'Kacper Kot',
                  'Jacek Kamiński',
                  'Kacper Fans',
                  'Aneta Kowalska',
                  'Jan Szymański',
                  'Amanda Kamień',
                  'Krzysztof Kot',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isAppointmentBooked ? null : _bookAppointment,
                child: const Text('Zarezerwuj wizytę'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.pink[200]! // Ustawienie różowego koloru przycisku
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}