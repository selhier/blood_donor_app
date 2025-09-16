import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:blood_donor_app/models/request_model.dart';
import 'package:blood_donor_app/widgets/request_card.dart';
import 'package:blood_donor_app/screens/profile_screen.dart';
import 'package:blood_donor_app/screens/request_form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Request> _requests = [
    Request(
      bloodType: 'A+',
      location: 'Santo Domingo',
      date: '25/11/2025',
      contactName: 'Carlos Pérez',
      contactPhone: '809-123-4567',
    ),
    Request(
      bloodType: 'O-',
      location: 'Santiago',
      date: '28/11/2025',
      contactName: 'María Rodríguez',
      contactPhone: '829-987-6543',
    ),
    Request(
      bloodType: 'B+',
      location: 'La Romana',
      date: '01/12/2025',
      contactName: 'Pedro Valdez',
      contactPhone: '809-555-1234',
    ),
  ];

  static final List<Widget> _widgetOptions = <Widget>[
    _buildRequestList(_requests),
    const RequestFormScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static Widget _buildRequestList(List<Request> requests) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          return RequestCard(request: requests[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donación de Sangre'),
        centerTitle: true,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidHeart),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.plus),
            label: 'Solicitar',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}