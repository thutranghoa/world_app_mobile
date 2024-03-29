import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  late final String userName;
  late final String email;
  late final String phoneNumber;
  late final String password;

  UserData({
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late UserData _userData = UserData(
    userName: '',
    email: '',
    phoneNumber: '',
    password: '',
  );

  late String _userId;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        _userId = user.uid;
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(_userId)
            .get();

        if (userSnapshot.exists) {
          setState(() {
            _userData = UserData(
              userName: userSnapshot['Username'],
              email: userSnapshot['Email'],
              phoneNumber: userSnapshot['Phone'],
              password: userSnapshot['Password'],
            );
            _isLoading = false;
          });
        } else {
          print('User data not found');
        }
      } else {
        print('No user is currently logged in');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Form submitted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                initialValue: _userData.userName,
                decoration: InputDecoration(labelText: 'User Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your user name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _userData.userName = value!;
                },
              ),
              TextFormField(
                initialValue: _userData.email,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _userData.email = value!;
                },
              ),
              TextFormField(
                initialValue: _userData.phoneNumber,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _userData.phoneNumber = value!;
                },
              ),
              TextFormField(
                initialValue: _userData.password,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _userData.password = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

