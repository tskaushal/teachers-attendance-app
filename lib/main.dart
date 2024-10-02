import 'package:flutter/material.dart';
import 'package:khwaish/attendance.dart';
import 'package:khwaish/leaveapp.dart';
import 'package:khwaish/leaves.dart';

void main() {
  runApp(GeoFlixApp());
}

class GeoFlixApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        '/dashboard': (context) => DashboardScreen(),
        '/leaveapp': (context) => Leaveapp(),
        '/leavest': (context) => LeaveStatusScreen(),
        '/atthistory': (context) => AttendanceHistoryScreen()
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFe1bee7), Color(0xFF9c27b0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Icon(
                Icons.business_center, // Placeholder icon for GeoFlix logo
                size: 80.0,
                color: Colors.white,
              ),
              SizedBox(height: 16),
              Text(
                'VIT faculty',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Geo-Based attendance system',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Employee ID',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Reset password logic
                            },
                            child: Text('Reset'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Forgot password logic
                            },
                            child: Text('Forgot Password?'),
                          ),
                        ],
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
                            // Navigate to Dashboard when login is successful
                            Navigator.pushNamed(context, '/dashboard');
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            // Other options logic
                          },
                          child: Text(
                            'Other Options',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Contact admin logic
                },
                child: Text.rich(
                  TextSpan(
                    text: "Don't have Login Details? ",
                    children: [
                      TextSpan(
                        text: 'Contact Admin',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD'),
        backgroundColor: Color(0xFF5e35b1), // Match the header color
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            ListView(children: [
              DashboardItem(
                icon: Icons.location_on,
                title: 'Attendance Recorder',
                subtitle: 'Mark your In and Out Time',
                onTap: () {
                  // Navigate or perform action for Attendance Recorder
                },
              ),
            ]),
            ListView(children: [
              DashboardItem(
                icon: Icons.bar_chart,
                title: 'Attendance Summary',
                subtitle: 'Check your previous record',
                onTap: () {
                  // Navigate or perform action for Attendance Summary

                  Navigator.pushNamed(context, '/atthistory');
                },
              ),
            ]),
            DashboardItem(
              icon: Icons.file_copy,
              title: 'Leaves Application',
              subtitle: 'Management',
              onTap: () {
                Navigator.pushNamed(context, '/leaveapp');
              },
            ),
            DashboardItem(
              icon: Icons.pending_actions,
              title: 'Leaves Status',
              subtitle: 'Check pending status of leaves',
              onTap: () {
                Navigator.pushNamed(context, '/leavest');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  DashboardItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40.0,
              color: Color(0xFF5e35b1), // Icon color to match the theme
            ),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
