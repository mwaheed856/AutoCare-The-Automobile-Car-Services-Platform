import 'package:flutter/material.dart';

class CarDetailsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Location Item
          _buildListTile(
            icon: Icons.location_city,
            title: "Location",
          ),
          const Divider(),

          // Car Model Item
          _buildListTile(
            icon: Icons.directions_car,
            title: "Car Model",
          ),
          const Divider(),

          // Registered In Item
          _buildListTile(
            icon: Icons.apartment,
            title: "Registered In",
          ),
          const Divider(),

          // Body Color Item
          _buildListTile(
            icon: Icons.color_lens,
            title: "Body Color",
          ),
        ],
      );
  }

  Widget _buildListTile({required IconData icon, required String title}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(
          icon,
          color: Colors.blueAccent,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.grey,
      ),
      onTap: () {
        // Define the action when tapped (optional)
      },
    );
  }
}
