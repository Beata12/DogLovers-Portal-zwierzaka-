// import 'package:flutter/material.dart';
// import 'appointment.dart';
//
// class BookedVisits extends StatefulWidget {
//   final List<Appointment> bookedAppointments;
//
//   const BookedVisits({Key? key, required this.bookedAppointments})
//       : super(key: key);
//
//   @override
//   _BookedVisitsState createState() => _BookedVisitsState();
// }
//
// class _BookedVisitsState extends State<BookedVisits> {
//   List<Appointment> _bookedAppointments = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _bookedAppointments = List.from(widget.bookedAppointments);
//   }
//
//   void _modifyAppointment(Appointment appointment) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         DateTime selectedDate = appointment.date;
//         String selectedTime = appointment.time;
//         String selectedSpecialist = appointment.specialist;
//
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return AlertDialog(
//               title: const Text('Modyfikuj wizytę'),
//               content: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Data: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
//                     const SizedBox(height: 10),
//                     Text('Godzina: $selectedTime'),
//                     const SizedBox(height: 10),
//                     Text('Specjalista: $selectedSpecialist'),
//                     const SizedBox(height: 20),
//                     Text('Wybierz nową datę:'),
//                     ElevatedButton(
//                       onPressed: () {
//                         showDatePicker(
//                           context: context,
//                           initialDate: selectedDate,
//                           firstDate: DateTime.now(),
//                           lastDate: DateTime(2032),
//                         ).then((DateTime? newDate) {
//                           if (newDate != null) {
//                             setState(() {
//                               selectedDate = newDate;
//                             });
//                           }
//                         });
//                       },
//                       child: Text('Wybierz datę'),
//                     ),
//                     const SizedBox(height: 10),
//                     const SizedBox(height: 10),
//                     Text('Wybierz nową godzinę:'),
//                     DropdownButton<String>(
//                       value: selectedTime,
//                       onChanged: (String? newTime) {
//                         setState(() {
//                           selectedTime = newTime!;
//                         });
//                       },
//                       items: <String>[
//                         '10:00',
//                         '12:00',
//                         '14:00',
//                         '16:00',
//                         '18:00',
//                       ].map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                     ),
//                     const SizedBox(height: 10),
//                     Text('Wybierz nowego specjalistę:'),
//                     DropdownButton<String>(
//                       value: selectedSpecialist,
//                       onChanged: (String? newSpecialist) {
//                         setState(() {
//                           selectedSpecialist = newSpecialist!;
//                         });
//                       },
//                       items: <String>[
//                         'Klaudia Nowak',
//                         'Kacper Kot',
//                         'Jacek Kamiński',
//                         'Kacper Fans',
//                         'Aneta Kowalska',
//                         'Jan Szymański',
//                         'Amanda Kamień',
//                         'Krzysztof Kot',
//                       ].map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                     ),
//
//                   ],
//                 ),
//               ),
//               actions: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text('Anuluj'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     setState(() {
//                       appointment.date = selectedDate;
//                       appointment.time = selectedTime;
//                       appointment.specialist = selectedSpecialist;
//                     });
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text('Zapisz'),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
//
//   void _deleteAppointment(Appointment appointment) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Usuń wizytę'),
//           content: const Text('Czy na pewno chcesz usunąć tę wizytę?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Anuluj'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _bookedAppointments.remove(appointment);
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Usuń'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Umówione wizyty'),
//       ),
//       backgroundColor: Colors.grey[400],
//       body: ListView.builder(
//         itemCount: _bookedAppointments.length,
//         itemBuilder: (context, index) {
//           final appointment = _bookedAppointments[index];
//           return Card(
//             margin: const EdgeInsets.all(10),
//             child: ListTile(
//               title: Text('Data: ${appointment.date.day}/${appointment.date.month}/${appointment.date.year}'),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Godzina: ${appointment.time}'),
//                   Text('Specjalista: ${appointment.specialist}'),
//                 ],
//               ),
//               trailing: IconButton(
//                 icon: Icon(Icons.edit),
//                 onPressed: () {
//                   _modifyAppointment(appointment);
//                 },
//               ),
//               onLongPress: () {
//                 _deleteAppointment(appointment);
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
