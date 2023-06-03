import 'package:flutter/material.dart';
import 'package:zaliczenie/pages/homePage.dart';
import 'package:zaliczenie/pages/profile.dart';

import 'BookedVisits.dart';

class ProfilePage extends StatefulWidget {
  final String ownerName;
  final String dogName;
  final String dateOfBirth;
  final String breed;

  ProfilePage({
    required this.ownerName,
    required this.dogName,
    required this.dateOfBirth,
    required this.breed,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      Profile(
        ownerName: widget.ownerName,
        dogName: widget.dogName,
        dateOfBirth: widget.dateOfBirth,
        breed: widget.breed,
      ),
      HomePage(),
      BookedVisits(bookedAppointments: []), // Dodaj pustą listę bookedAppointments
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Wizyty',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink[400],
        onTap: _onItemTapped,
      ),
    );
  }
}


