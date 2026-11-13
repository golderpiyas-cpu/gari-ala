
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
      title: 'গাড়ি আলা',
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
  final pickupController = TextEditingController();
  final destinationController = TextEditingController();

  String selectedVehicle = 'মোটরসাইকেল';

  @override
  void dispose() {
    pickupController.dispose();
    destinationController.dispose();
    super.dispose();
  }

  void requestRide({bool reserve = false}) {
    if (pickupController.text.trim().isEmpty ||
        destinationController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('পিকআপ ও গন্তব্য লিখুন'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          reserve ? 'রিজার্ভ অনুরোধ' : 'রাইড অনুরোধ',
        ),
        content: Text(
          'গাড়ি: $selectedVehicle\n'
          'পিকআপ: ${pickupController.text}\n'
          'গন্তব্য: ${destinationController.text}\n\n'
          'এটি এখনো ডেমো সংস্করণ। '
          'আসল চালক খোঁজা ও বুকিং চালু হয়নি।',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text(
          'গাড়ি আলা 🏍️',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 15),

          const Icon(
            Icons.location_city,
            size: 55,
            color: Colors.green,
          ),

          const SizedBox(height: 10),

          const Text(
            'আপনার যাত্রা, আপনার শহর',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'খুলনা জেলার যাত্রীদের জন্য',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 28),

          TextField(
            controller: pickupController,
            decoration: const InputDecoration(
              labelText: 'কোথা থেকে যাবেন?',
              hintText: 'আপনার পিকআপ স্থান লিখুন',
              prefixIcon: Icon(Icons.my_location),
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: destinationController,
            decoration: const InputDecoration(
              labelText: 'কোথায় যাবেন?',
              hintText: 'আপনার গন্তব্য লিখুন',
              prefixIcon: Icon(Icons.location_on),
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'আপনার পছন্দের গাড়ি নির্বাচন করুন',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: RadioListTile<String>(
              value: 'মোটরসাইকেল',
              groupValue: selectedVehicle,
              onChanged: (value) {
                setState(() {
                  selectedVehicle = value!;
                });
              },
              secondary: const Icon(
                Icons.two_wheeler,
                size: 35,
                color: Colors.green,
              ),
              title: const Text('মোটরসাইকেল'),
              subtitle: const Text('দ্রুত যাতায়াত'),
            ),
          ),

          Card(
            child: RadioListTile<String>(
              value: 'প্রাইভেট কার',
              groupValue: selectedVehicle,
              onChanged: (value) {
                setState(() {
                  selectedVehicle = value!;
                });
              },
              secondary: const Icon(
                Icons.directions_car,
                size: 35,
                color: Colors.green,
              ),
              title: const Text('প্রাইভেট কার'),
              subtitle: const Text('আরামদায়ক যাতায়াত'),
            ),
          ),

          const SizedBox(height: 22),

          SizedBox(
            height: 55,
            child: FilledButton.icon(
              onPressed: () => requestRide(),
              icon: const Icon(Icons.search),
              label: const Text(
                'রাইড খুঁজুন',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 55,
            child: OutlinedButton.icon(
              onPressed: () => requestRide(reserve: true),
              icon: const Icon(Icons.event_available),
              label: const Text(
                'রিজার্ভ করবেন',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),

          const SizedBox(height: 28),

          const Divider(),

          const Text(
            'গাড়ি আলা',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),

          const Text(
            'আপনার যাত্রা, আপনার শহর',
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
