import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:blood_donor_app/models/request_model.dart';
class RequestCard extends StatelessWidget {
  final Request request;
  const RequestCard({Key? key, required this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(FontAwesomeIcons.droplet, color: Colors.red, size: 24),
                const SizedBox(width: 12),
                Text(
                  request.bloodType,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const Spacer(),
                const Icon(FontAwesomeIcons.calendarDay, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  request.date,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const Divider(color: Colors.redAccent, height: 20),
            Row(
              children: [
                const Icon(FontAwesomeIcons.locationDot, color: Colors.black54),
                const SizedBox(width: 8),
                Text(request.location),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(FontAwesomeIcons.phone, color: Colors.black54),
                const SizedBox(width: 8),
                Text(request.contactPhone),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Lógica para aceptar la solicitud
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Has aceptado la solicitud de ${request.contactName}'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                icon: const Icon(FontAwesomeIcons.handshake),
                label: const Text('Aceptar solicitud'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}