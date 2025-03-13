import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro Display',
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String getCurrentTime() {
    final now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 149, 199, 224),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getCurrentTime(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: const [
                        Text('••••'),
                        SizedBox(width: 8),
                        Icon(Icons.network_cell, size: 16),
                        SizedBox(width: 8),
                        Icon(Icons.battery_full, size: 16),
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu),
                  const Text(
                    'Weather App',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),

              const Text(
                'Yogyakarta',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Orbitron',
                  color: Color.fromARGB(255, 10, 8, 12),
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 10),

              const Text(
                'Today',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 128, 120, 120),
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 20),

              const Text(
                '28°C',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 11, 119, 213),
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 20),
              const Divider(height: 1, color: Colors.grey),
              const SizedBox(height: 20),
              const Text(
                'Sunny',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 75, 74, 74),
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '☀️', 
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFFFFA726),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '5 km/h',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF4285F4),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Next 7 days',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildForecastItem('Now', '☀️'),
                          _buildForecastItem('17.00', '🌤️'),
                          _buildForecastItem('20.00', '☁️'),
                          _buildForecastItem('23.00', '🌧️'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForecastItem(String time, String icon) {
    return Column(
      children: [
        Text(
          time,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFE94057), 
          ),
        ),
        const SizedBox(height: 8),
        Text(
          icon, 
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '28°C',
          style: TextStyle(
            color: Color(0xFF4285F4),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Icon(
              Icons.air,
              size: 16,
              color: Color(0xFFE94057),
            ),
            SizedBox(width: 2),
            Text(
              '10 km/h',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFFE94057),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          '⚡',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const Text(
          '0 %',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
