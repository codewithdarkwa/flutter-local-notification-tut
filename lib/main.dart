import 'package:flutter/material.dart';

import 'notification/notification.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  tz.initializeTimeZones();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                NotificationService.showInstantNotification(
                    "Instant Notification", "This shows an instant notifications");
              },
              child: const Text('Show Notification'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                DateTime scheduledDate = DateTime.now().add( const Duration(seconds: 5));
                NotificationService.scheduleNotification(
                  0,
                  "Scheduled Notification",
                  "This notification is scheduled to appear after 5 seconds",
                  scheduledDate,
                );
              },
              child: const Text('Schedule Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
