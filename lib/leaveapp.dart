import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Leaveapp extends StatefulWidget {
  const Leaveapp({super.key});

  @override
  State<Leaveapp> createState() => _LeaveappState();
}

class _LeaveappState extends State<Leaveapp> {
  final TextEditingController _managerController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  bool _medicalLeave = false;
  bool _annualLeave = false;
  bool _casualLeave = false;
  String selectedFromDate = '';
  String selectedToDate = '';

  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Application'),
        backgroundColor: Color(0xFF5e35b1),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available Leaves',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _leaveButton('CL - 1', Color(0xFFe57373)),
                  _leaveButton('AL - 2', Color(0xFF64b5f6)),
                  _leaveButton('ML - 0', Color(0xFF81c784)),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                controller: _managerController,
                decoration: InputDecoration(
                  labelText: 'Your Manager',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Today's Date",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _fromDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'From',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onTap: () => _selectDate(context, _fromDateController),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: _toDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'To',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onTap: () => _selectDate(context, _toDateController),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Number of days on leave: -',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Type of leave',
                style: TextStyle(fontSize: 16),
              ),
              CheckboxListTile(
                title: Text("Medical Leave"),
                value: _medicalLeave,
                onChanged: (newValue) {
                  setState(() {
                    _medicalLeave = newValue ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Annual Leave"),
                value: _annualLeave,
                onChanged: (newValue) {
                  setState(() {
                    _annualLeave = newValue ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Casual Leave"),
                value: _casualLeave,
                onChanged: (newValue) {
                  setState(() {
                    _casualLeave = newValue ?? false;
                  });
                },
              ),
              SizedBox(height: 16),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Message for Management (Optional)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5e35b1),
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    // Submit logic
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _leaveButton(String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onPressed: () {
        // Leave button logic
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
