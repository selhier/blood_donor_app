import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PublishRequestScreen extends StatefulWidget {
  const PublishRequestScreen({Key? key}) : super(key: key);

  @override
  _PublishRequestScreenState createState() => _PublishRequestScreenState();
}

class _PublishRequestScreenState extends State<PublishRequestScreen> {
  DateTime? _selectedDate;
  final TextEditingController _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publish Request'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Request Details:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _detailsController,
              decoration: const InputDecoration(
                labelText: 'Details',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Select a Date:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                });
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.red.shade100,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Handle request submission
                if (_detailsController.text.isNotEmpty && _selectedDate != null) {
                  // Submit the request
                  Navigator.pop(context);
                } else {
                  // Show an error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields and select a date.')),
                  );
                }
              },
              child: const Text('Submit Request'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
