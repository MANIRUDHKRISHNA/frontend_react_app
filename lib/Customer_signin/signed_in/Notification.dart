import 'dart:async';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isMuted = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startNotificationTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startNotificationTimer() {
    // Schedule notification every 2 minutes if not muted
    _timer = Timer.periodic(Duration(minutes: 2), (timer) {
      if (!isMuted) {
        _showNotification();
      }
    });
  }

  void _showNotification() {
    // Using SnackBar as a simple notification simulation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('This is a new notification'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _toggleMuteNotifications() {
    setState(() {
      isMuted = !isMuted;
      if (isMuted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Notifications muted'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Notifications unmuted'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Text('Notifications are ${isMuted ? "muted" : "active"}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleMuteNotifications,
        child: Icon(isMuted ? Icons.notifications_off : Icons.notifications),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: NotificationScreen(),
    ),
  );
}
