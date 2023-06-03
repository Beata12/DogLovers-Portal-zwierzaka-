import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zaliczenie/pages/profilePage.dart';

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String _ownerName = '';
  String _dogName = '';
  String _dateOfBirth = '';
  String _breed = '';
  bool _showDateError = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _dateOfBirth = DateFormat('yyyy-MM-dd').format(pickedDate);
        _showDateError = false;
      });
    }
  }

  String? _validateDateOfBirth(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the date of birth';
    }
    try {
      final DateTime? enteredDate = DateFormat('yyyy-MM-dd').parseStrict(value);
      if (enteredDate == null || value != DateFormat('yyyy-MM-dd').format(enteredDate)) {
        return 'Invalid date format. Please enter a valid date (yyyy-MM-dd)';
      }
      final DateTime currentDate = DateTime.now();
      if (enteredDate.isAfter(currentDate)) {
        return 'Please enter a valid date of birth';
      }
      return null;
    } catch (e) {
      return 'Error parsing date. Please enter a valid date (yyyy-MM-dd)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: Text(
          'Profile Form',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.pink[300],
          ),
        ),
      ),
      body: SingleChildScrollView( // Wrap the body with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildQuestionField(
                  labelText: 'Owner Name',
                  hintText: 'Enter the owner\'s name',
                  onSaved: (value) {
                    _ownerName = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the owner\'s name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _buildQuestionField(
                  labelText: 'Dog Name',
                  hintText: 'Enter the dog\'s name',
                  onSaved: (value) {
                    _dogName = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the dog\'s name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    height: 60,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Date of Birth',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                if (_showDateError)
                  Text(
                    'Please enter the date of birth',
                    style: TextStyle(color: Colors.red),
                  ),
                SizedBox(height: 20),
                _buildQuestionField(
                  labelText: 'Breed',
                  hintText: 'Enter the dog\'s breed',
                  onSaved: (value) {
                    _breed = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the dog\'s breed';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showDateError = false;
                    });
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (_dateOfBirth.isEmpty) {
                        setState(() {
                          _showDateError = true;
                        });
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(
                              ownerName: _ownerName,
                              dogName: _dogName,
                              dateOfBirth: _dateOfBirth,
                              breed: _breed,
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[300],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionField({
    required String labelText,
    required String hintText,
    required void Function(String?) onSaved,
    required String? Function(String?) validator,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white54),
          border: InputBorder.none,
        ),
        style: TextStyle(color: Colors.white),
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}