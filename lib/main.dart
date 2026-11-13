
import 'package:flutter/material.dart';

void main() {
  runApp(const GariAlaApp());
}

class GariAlaApp extends StatelessWidget {
  const GariAlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'গাড়ি অালা',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pickup = TextEditingController();
  final destination = TextEditingController();

  @override
  void dispose() {
    pickup.dispose();
    destination.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'গাড়ি অালা 🏍️',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),
          const Text(
            'আপনার যাত্রা, আপনার শহর',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          TextField(
            controller: pickup,
            decoration: const InputDecoration(
              labelText: 'কোথা থেকে যাবেন?',
              prefixIcon: Icon(Icons.my_location),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: destination,
            decoration: const InputDecoration(
              labelText: 'কোথায় যাবেন?',
              prefixIcon: Icon(Icons.location_on),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          const Card(
            child: ListTile(
              leading: Icon(Icons.two_wheeler, size: 35),
              title: Text('মোটরসাইকেল'),
              subtitle: Text('গাড়ি অালা রাইড'),
            ),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () {
              if (pickup.text.trim().isEmpty ||
                  destination.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('পিকআপ ও গন্তব্য লিখুন'),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('গাড়ি অালা'),
                    content: const Text(
                      'এটি প্রাথমিক ডেমো। এখনো আসল চালক বা রাইড বুকিং যুক্ত হয়নি।',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('ঠিক আছে'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: Text('রাইড খুঁজুন'),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'খুলনা জেলার যাত্রীদের জন্য',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
