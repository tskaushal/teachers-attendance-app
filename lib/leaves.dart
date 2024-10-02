import 'package:flutter/material.dart';

class LeaveStatusScreen extends StatelessWidget {
  const LeaveStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave Status'),
      ),
      body: ListView(
        children: [
          _buildLeaveStatusTile(
            'Annual Leave',
            '01-10-2024 - 3-10-2024',
            'Approved',
            '09-10-2019',
            Icons.check_circle,
          ),
          _buildLeaveStatusTile(
            'Medical Leave',
            '10-9-2024 - 12-9-2024',
            'Approved',
            '10-12-2024',
            Icons.check_circle,
          ),
          _buildLeaveStatusTile(
            'Casual Leave',
            '04-8-2024 - 07-8-2024',
            'Rejected',
            '04-8-2024',
            Icons.cancel,
          ),
          _buildLeaveStatusTile(
            'Casual Leave',
            '09-7-2024 - 13-7-2024',
            'Rejected',
            '09-7-2024',
            Icons.cancel,
          ),
          _buildLeaveStatusTile(
            'Casual Leave',
            '20-11-2018',
            'Approved',
            '20-11-2018',
            Icons.check_circle,
          ),
        ],
      ),
    );
  }

  Widget _buildLeaveStatusTile(String leaveType, String leaveDates,
      String status, String appliedOn, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(leaveType),
        subtitle:
            Text('Dates: $leaveDates\nStatus: $status\nApplied on: $appliedOn'),
      ),
    );
  }
}
