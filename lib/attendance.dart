import 'package:flutter/material.dart';

class AttendanceHistoryScreen extends StatelessWidget {
  const AttendanceHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance History'),
      ),
      body: Column(
        children: [
          // Month header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // Handle previous month navigation
                },
              ),
              const Text('October 2024'),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  // Handle next month navigation
                },
              ),
            ],
          ),

          // Calendar grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.0,
            ),
            itemCount: 31,
            itemBuilder: (context, index) {
              final day = index + 1;
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(day.toString()),
                ),
              );
            },
          ),

          // Attendance history preview
          const Text('Attendance History Preview'),
          ListTile(
            leading: const Icon(Icons.check),
            title: const Text('Type: IN'),
            subtitle: const Text('Time: 19 hours 46 minutes at VIT CHENNAI'),
          ),
          ListTile(
            leading: const Icon(Icons.check),
            title: const Text('Type: IN'),
            subtitle: const Text('Time: 20 hours 7 minutes at VIT CHENNAI'),
          ),
          ListTile(
            leading: const Icon(Icons.check),
            title: const Text('Type: IN'),
            subtitle: const Text('Time: 19 hours 46 minutes at VIT CHENNAI'),
          ),
          ListTile(
            leading: const Icon(Icons.check),
            title: const Text('Type: IN'),
            subtitle: const Text('Time: 20 hours 6 minutes at VIT CHENNAI'),
          ),
        ],
      ),
    );
  }
}
